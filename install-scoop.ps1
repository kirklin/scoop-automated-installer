Write-Output 'Welcome to the automatic installation scoop script by Kirk Lin'
set-executionpolicy remotesigned -scope currentuser
# Function to check if Scoop is installed
function Test-ScoopInstalled {
  # Check if the SCOOP environment variable is set
  if (!(Test-Path $env:SCOOP)) {
    Write-Output "Scoop is not installed."
    return $false
  }
  else {
    Write-Output "Scoop is already installed at $env:SCOOP"
    return $true
  }
}

# Function to install Scoop
function Install-Scoop {
  try {
    # Set the SCOOP environment variable
    $env:SCOOP = 'C:\Application\scoop'
    [environment]::setEnvironmentVariable('SCOOP', $env:SCOOP, 'User')
    
    # Download and install Scoop
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
  }
  catch {
    # Handle the error
    Write-Output "An error occurred while installing Scoop: $($_.Exception.Message)"
  }
}
# Function to check and install Scoop
function Test-And-Install-Scoop {
  [int]$psVersionValue = $psversiontable.psversion.major # should be >= 5.0
  if ($psVersionValue -ge 5) {
    if (!(Test-ScoopInstalled)) {

      #Scoop is not installed, so install it
      Install-Scoop
    
    }
  }
  else {
    # PowerShell version is less than 5.0
    Write-Output 'Make sure you have PowerShell 5.0 or later installed. If you are on Windows 10 or Windows Server 2012 you should be all set, but Windows 7 and Windows Server 2008 might have older versions.'
  }
}
# Function to add Scoop buckets
function Add-ScoopBuckets {
  try {
    scoop bucket add main 'https://github.com/ScoopInstaller/Main'
    scoop bucket add extras 'https://github.com/ScoopInstaller/scoop-extras'
    scoop bucket add versions 'https://github.com/ScoopInstaller/Versions'
    scoop bucket add jetbrains 'https://github.com/Ash258/Scoop-JetBrains'
    scoop bucket add java 'https://github.com/ScoopInstaller/Java'
    scoop bucket add dorado 'https://github.com/chawyehsu/dorado'
    scoop bucket add scoopet 'https://github.com/ivaquero/scoopet'
    scoop update
  }
  catch {
    # Handle the error
    Write-Output "An error occurred while adding Scoop buckets: $($_.Exception.Message)"
  }
}


# Install Common software
function Install-CommonSoftware {
  try {
    scoop install main/git
    scoop install clash-for-windows
    scoop install sudo
    scoop install scoop-completion
    scoop install googlechrome
    scoop install potplayer
    scoop install ffmpeg
    scoop install typora
    scoop install wechat
    scoop install neteasemusic
    scoop install yesplaymusic
    scoop install wechatwork
    
    Write-Output 'Success Install Common software!!!'
  }
  catch {
    # Handle the error
    Write-Output "An error occurred while installing common software: $($_.Exception.Message)"
  }
}

# Install Programming environment
function Install-ProgrammingEnvironment {
  try {
    scoop install extras/github
    scoop install nodejs-lts
    scoop install python
    scoop install openjdk8-redhat
    scoop install openjdk17
    scoop install openjdk11
    scoop install gradle
    scoop install maven
    scoop install go
    scoop install mysql
    scoop install mysql-workbench
    scoop install postgresql
    
    Write-Output 'Success Install Programming environment!!!'
  }
  catch {
    # Handle the error
    Write-Output "An error occurred while installing programming environment: $($_.Exception.Message)"
  }
}

# Install Programming IDE
function Install-ProgrammingIDEs {
  try {
    scoop install vscode
    scoop install IntelliJ-IDEA-Ultimate
    scoop install WebStorm
    scoop install DataGrip
    scoop install PyCharm-Professional
    scoop install CLion
    scoop install GoLand
    scoop install android-studio
    scoop install wechatdevtools
      
    Write-Output 'Success Install Programming IDE!!!'
  }
  catch {
    # Handle the error
    Write-Output "An error occurred while installing programming IDEs: $($_.Exception.Message)"
  }
}

Test-And-Install-Scoop
Add-ScoopBuckets
Install-CommonSoftware
Install-ProgrammingEnvironment
Install-ProgrammingIDEs 

Write-Output 'End of script run. Have a good time~ '
