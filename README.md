# Automatic installation script for Scoop by Kirk Lin

This script automatically installs Scoop, a command-line installer for Windows, and sets up a development environment including common software, programming environments, and programming IDEs.

## Prerequisites

- Make sure you have PowerShell 5.0 or later installed. If you are on Windows 10 or Windows Server 2012 you should be all set, but Windows 7 and Windows Server 2008 might have older versions.

## Installation

1. Download or clone the script from this repository.
2. Open a PowerShell window as an administrator.
3. Set the execution policy to `remotesigned` for the current user by running the following command:
```powershell
set-executionpolicy remotesigned -scope currentuser
```
4. Navigate to the directory where the script is located.
5. Run the script by typing `.\install-scoop.ps1` and pressing Enter.

## Configuration

The script sets the SCOOP environment variable to `C:\Application\scoop` and adds the following buckets:

- main: https://github.com/ScoopInstaller/Main
- extras: https://github.com/ScoopInstaller/scoop-extras
- versions: https://github.com/ScoopInstaller/Versions
- jetbrains: https://github.com/Ash258/Scoop-JetBrains
- java: https://github.com/ScoopInstaller/Java
- dorado: https://github.com/chawyehsu/dorado
- scoopet: https://github.com/ivaquero/scoopet

## Features

The script installs the following software:

### Common software

- Git
- Clash for Windows
- Sudo
- Scoop completion
- Google Chrome
- PotPlayer
- FFmpeg
- Typora
- WeChat
- Netease Music
- YesPlay Music
- WeChat Work

### Programming environments

- GitHub
- Node.js (LTS version)
- Python
- OpenJDK 8 (Red Hat version)
- OpenJDK 17
- OpenJDK 11
- Gradle
- Maven
- Go
- MySQL
- MySQL Workbench
- PostgreSQL

## Programming IDEs

The following IDEs are also included in this script:

- Visual Studio Code
- IntelliJ IDEA Ultimate
- WebStorm
- DataGrip
- PyCharm Professional
- CLion
- GoLand
- Android Studio
- WeChat DevTools


## Notes

- The script may take a while to complete, depending on your internet connection and the software being installed.
- Some software may require additional configuration after installation. Please refer to the respective documentation for more information.
- This script is provided as is and may not work for all systems. Please use it at your own risk.

## Credits

- [Scoop](https://github.com/ScoopInstaller/Scoop)
- [Kirk Lin](https://github.com/kirklin)

## License

This script is licensed under the MIT License. Please see the [LICENSE](LICENSE) file for details.
