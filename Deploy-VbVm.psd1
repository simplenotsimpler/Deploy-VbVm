#
# Module manifest for module 'Deploy-VbVm'
#
# Generated by: SimpleNotSimpler
#
# Generated on: 9/17/2020
#

@{

# Script module or binary module file associated with this manifest.
RootModule = '.\Deploy-VbVm.psm1'

# Version number of this module.
ModuleVersion = '1.0.0'

# Supported PSEditions
CompatiblePSEditions = 'Core'

# ID used to uniquely identify this module
GUID = 'd55b9097-f932-4129-9769-e0082e5da40c'

# Author of this module
Author = 'SimpleNotSimpler'

# Company or vendor of this module
CompanyName = 'SimpleNotSimpler'

# Copyright statement for this module
Copyright = 'MIT License. Copyright (c) 2020 SimpleNotSimpler.'

# Description of the functionality provided by this module
# Description = ''

# Minimum version of the PowerShell engine required by this module
PowerShellVersion = '7.0.3'

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# ClrVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @(
  @{ModuleName='New-Autoinstall'; ModuleVersion='1.0.0'; GUID = 'b7a70aa3-1011-45a6-b19e-e708e96aa61a'},
  @{ModuleName='New-PackerVbFile'; ModuleVersion = '1.0.0'; GUID = 'a41783fa-5fe0-41f8-a399-0ae30965dba5'},
  @{ModuleName='Invoke-PackerBuildVbVm'; ModuleVersion = '1.0.0'; GUID = '1116ac24-034d-4e88-9eac-cbc7c7d4d165'}
)

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
# FunctionsToExport = @('Deploy-VbVm')
FunctionsToExport = @('Deploy-VbVm')

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
FileList = @('.\sample-deploy-variables.json', '.\README.md', '.\docs\Deploy-VbVm.md')

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        # Tags = @()

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/simplenotsimpler/Deploy-VbVm/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/simplenotsimpler/Deploy-VbVm'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
HelpInfoURI = 'https://github.com/simplenotsimpler/Deploy-VbVm/docs/Deploy-VbVm.md'

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

