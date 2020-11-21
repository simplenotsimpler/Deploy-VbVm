<#
.SYNOPSIS
Deploys a new local Ubuntu VirtualBox virtual machine using a cloud-init autoinstall config file and Packer.

.DESCRIPTION
Deploys a new local Ubuntu VirtualBox virtual machine using a cloud-init autoinstall config file and Packer.

Depends on the following modules:
* New-Autoinstall
* New-PackerVbFile
* Invoke-PackerBuildVbVm

Requires that Packer and VirtualBox are both installed and in your System PATH.

.EXAMPLE
Deploy-VbVm

.EXAMPLE
Deploy-VbVm -StartLog

.EXAMPLE
Deploy-VbVm -DeployVariablesFile "sample-deploy-variables.json" -VbVmName "test-machine" -StartLog -LogFile "mylog.log"

.PARAMETER DeployVariablesFile
JSON file which houses variables for deployment. See .https://github.com/simplenotsimpler/Deploy-VbVm/sample-deploy-variables.json for JSON schema info.

.PARAMETER Overwrite
Use Overwrite switch if you want to remove the VirtualBox machine if it already exists.

.PARAMETER StartLog
Switch. Use this if you want a combined log when this script runs. Otherwise, each invoked function will create its own individual log.

.PARAMETER LogFile
Path to log file. If not specified, defaults to "logs\$ModuleName-$LogDate.log".

.INPUTS
None. You cannot pipe objects to Deploy-VbVm.ps1

.OUTPUTS
VirtualBox virtual machine which is updated and configured to your specifications.

.NOTES
Autoinstall and Packer build files are opinionated, but can be tweaked to suit your needs.

This configures a second NIC because using SSH to a host-only adapter is more reliable than depending on port forwarding, especially if you're in a corporate enviroment. You'll need to configure a static IP of the 192.168.56.x format.

.LINK
https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7

.LINK
https://www.virtualbox.org/

.LINK
https://www.packer.io/

.LINK
https://www.packer.io/docs/builders/virtualbox/iso

.LINK
https://github.com/simplenotsimpler/New-Autoinstall

.LINK
https://github.com/simplenotsimpler/New-PackerVbFile

.LINK
https://github.com/simplenotsimpler/Invoke-PackerBuildVbVm

.LINK
https://github.com/simplenotsimpler/Deploy-VbVm

#>

function Deploy-VbVm {
  [CmdletBinding()]
  param (
    [Alias("File")]
    [System.IO.FileInfo]$DeployVariablesFile="deploy-variables.json",
    [Switch]$Overwrite,
    [Switch]$StartLog,
    [String]$LogFile
  )

  begin {

    $ErrorActionPreference = 'Stop'
    $VerbosePreference = "Continue"
    $ModuleName=$MyInvocation.MyCommand
    $PSDefaultParameterValues = @{"*:Verbose"=$True}
    $LogDate=(Get-Date -Format 'yyyy-MM-dd-HHmm')
    if(!$LogFile){
      $LogFile="logs\$ModuleName-$LogDate.log"
    }
    $Separator="================================"

    if($StartLog){
      Start-Transcript $LogFile -Append
    }

    Write-Verbose $Separator
    Write-Verbose "     Begin $ModuleName Log"
    Write-Verbose $Separator

    #Validate $DeployVariablesFile
    try{
      if( -Not ($DeployVariablesFile | Test-Path -PathType Leaf) ){
          throw "$DeployVariablesFile does not exist"
      }
      if (-Not ((Get-Content -Path $DeployVariablesFile -Raw) | Test-Json -ErrorAction Ignore )){
        throw "$DeployVariablesFile is not valid JSON"
      }
    }
    catch{
      Write-Error "$ModuleName::$_"
    }

    Write-Verbose "Checking for Packer and VBoxManage"
    try {
      if( -Not([bool] (Get-Command -ErrorAction Ignore -Type Application packer)) ){
        throw "Unable to find Packer executable. Please add it to your System Path."
      }

      if( -Not([bool] (Get-Command -ErrorAction Ignore -Type Application VBoxManage)) ){
        throw "Unable to find VBoxManage executable. Please add it to your System Path."
      }
    }
    catch {
      Write-Error "$ModuleName::$_"
    }

    Write-Verbose "$ModuleName::Processing $DeployVariablesFile"
    #region Convert File to Hashtable
    $DeployVariablesContent = (Get-Content -Path $DeployVariablesFile -Raw -Encoding UTF8 )

    [Hashtable]$DeployVariables = ($DeployVariablesContent | ConvertFrom-JSON -AsHashTable)

    #endregion Convert File to Hashtable

    #region Assign to PackerParams Hashtable
    $PackerParams = @{
      VbVmName = "$($DeployVariables.UserData.Hostname)"
      IsoCheckSum = "$($DeployVariables.PackerParams.IsoCheckSum)"
      IsoUrl = "$($DeployVariables.PackerParams.IsoUrl)"
      HttpDirectory = "$($DeployVariables.PackerParams.HttpDirectory)"
      ShutdownTimeOut = "$($DeployVariables.PackerParams.ShutdownTimeOut)"
      OutFile="$($DeployVariables.PackerParams.OutFile)"
    }

    if ($DeployVariables.PackerParams.Headless){
      $PackerParams.Add("Headless", $DeployVariables.PackerParams.Headless)
    }
    #endregion Assign to PackerParams Hashtable

  }

  process {

    #if startlog, use a combined log.
    if($StartLog){
      New-Autoinstall -DeployVariablesFile $DeployVariablesFile -OutPath $PackerParams.HttpDirectory -LogFile $LogFile
      New-PackerVbFile @PackerParams -LogFile $LogFile

      if(!$Overwrite){
        Invoke-PackerBuildVbVm -PackerFile $PackerParams.OutFile -LogFile $LogFile
      }
      else {
        Invoke-PackerBuildVbVm -PackerFile $PackerParams.OutFile -Overwrite -LogFile $LogFile
      }

    }
    #otherwise, generate separate log files
    else {

      New-Autoinstall -DeployVariablesFile $DeployVariablesFile -OutPath $PackerParams.HttpDirectory -StartLog
      New-PackerVbFile @PackerParams -StartLog
      Invoke-PackerBuildVbVm -PackerFile $PackerParams.OutFile -Overwrite -StartLog
    }

  }

  end {
    Write-Verbose $Separator
    Write-Verbose "      End $ModuleName"
    Write-Verbose $Separator

    if($StartLog){
      Stop-Transcript
    }
  }
}
