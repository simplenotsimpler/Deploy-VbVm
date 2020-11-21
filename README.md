# Deploy-VbVm
A PowerShell 7+ script which deploys a local Ubuntu VirtualBox virtual machine using a cloud-init autoinstall config file and Packer.

# Getting Started
## Installation
To install, drop the entire Deploy-VbVm folder into one of your PowerShell 7 (or later) module directories. The default PowerShell module paths are listed in the **$Env:PSModulePath** environment variable.

## Requires

* [PowerShell 7+ Core](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7)
* [VirtualBox (6.1.12 or higher)](https://www.virtualbox.org/)
* [Packer](https://www.packer.io/)
* [New-Autoinstall](https://github.com/simplenotsimpler/New-Autoinstall)
* [New-PackerVbFile](https://github.com/simplenotsimpler/New-PackerVbFile)
* [Invoke-PackerBuildVbVm](https://github.com/simplenotsimpler/Invoke-PackerBuildVbVm)

Packer and VirtualBox are both installed and in your System PATH.

## Usage

Refer to the comment-based help in the module script for detailed usage information or see [Deploy-VbVm.md](./docs/Deploy-VbVm.md)

# Notes
This has only been tested on PowerShell 7 Core on Windows 10 2004. Your mileage may vary if using this with PowerShell 5.1 or PowerShell 6 (Core) and/or other OSes.

# PowerShell Local DevOps
[New-Autoinstall](https://github.com/simplenotsimpler/New-Autoinstall)

[New-PackerVbFile](https://github.com/simplenotsimpler/New-PackerVbFile)

[Invoke-PackerBuildVbVm](https://github.com/simplenotsimpler/Invoke-PackerBuildVbVm)

[DeployVbVm](https://github.com/simplenotsimpler/Deploy-VbVm)
 
# License
Deploy-VbVm is [MIT licensed](./LICENSE).