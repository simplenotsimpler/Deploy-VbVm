# Deploy-VbVm

## SYNOPSIS
Deploys a local Ubuntu VirtualBox virtual machine using a cloud-init autoinstall config file and Packer.

## SYNTAX

```
Deploy-VbVm [[-DeployVariablesFile] <FileInfo>] [-StartLog] [[-LogFile] <String>] [<CommonParameters>]
```

## DESCRIPTION
Deploys a local Ubuntu VirtualBox virtual machine using a cloud-init autoinstall config file and Packer.

Depends on the following modules:
* New-Autoinstall
* New-PackerVbFile
* Invoke-PackerBuildVbVm

Requires that Packer and VirtualBox are both installed and in your System PATH.

## EXAMPLES

### EXAMPLE 1
```
Deploy-VbVm
```

### EXAMPLE 2
```
Deploy-VbVm -StartLog
```

### EXAMPLE 3
```
Deploy-VbVm -DeployVariablesFile "sample-deploy-variables.json" -VbVmName "test-machine" -StartLog -LogFile "mylog.log"
```

## PARAMETERS

### -DeployVariablesFile
JSON file which houses variables for deployment.
See .\sample-deploy-variables.json for JSON schema info.

```yaml
Type: FileInfo
Parameter Sets: (All)
Aliases: File

Required: False
Position: 1
Default value: Deploy-variables.json
Accept pipeline input: False
Accept wildcard characters: False
```

### -StartLog
Switch.
Use this if you want a combined log when this script runs.
Otherwise, each invoked function will create its own individual log.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogFile
Path to log file.
If not specified, defaults to "logs\$ModuleName-$LogDate.log".

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None. You cannot pipe objects to Deploy-VbVm.ps1
## OUTPUTS

### VirtualBox virtual machine which is updated and configured to your specifications.
## NOTES
Autoinstall and Packer build files are opinionated, but can be tweaked to suit your needs.

This configures a second NIC because using SSH to a host-only adapter is more reliable than depending on port forwarding, especially if you're in a corporate enviroment.
You'll need to configure a static IP of the 192.168.56.x format.

## RELATED LINKS

[https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7)

[https://www.virtualbox.org/](https://www.virtualbox.org/)

[https://www.packer.io/](https://www.packer.io/)

[https://www.packer.io/docs/builders/virtualbox/iso](https://www.packer.io/docs/builders/virtualbox/iso)

[https://github.com/simplenotsimpler/New-Autoinstall](https://github.com/simplenotsimpler/New-Autoinstall)

[https://github.com/simplenotsimpler/New-PackerVbFile](https://github.com/simplenotsimpler/New-PackerVbFile)

[https://github.com/simplenotsimpler/Invoke-PackerBuildVbVm](https://github.com/simplenotsimpler/Invoke-PackerBuildVbVm)

[https://github.com/simplenotsimpler/Deploy-VbVm](https://github.com/simplenotsimpler/Deploy-VbVm)

