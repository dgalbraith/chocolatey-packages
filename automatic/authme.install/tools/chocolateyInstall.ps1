$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$installer  = Join-Path $toolsDir 'authme-6.3.1-windows-x64.msi'
$silentArgs = '/S /AllUsers'

$pp = Get-PackageParameters

if ($pp.User) {
  $silentArgs = $silentArgs.Replace('AllUsers','CurrentUser')
}

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  File           = $installer
  FileType       = 'msi'
  SilentArgs     = $silentArgs
  ValidExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs

# the desktop shortcut for Authme is added by default on install - remove unless retention has been specified with /AddToDesktop
if (-not $addToDesktop) {
  if ($pp.User) {
    $desktopPath = [Environment]::GetFolderPath('Desktop')
  } else {
    $desktopPath = [Environment]::GetFolderPath('CommonDesktopDirectory')
  }

  $shortcutPath = "$desktopPath\Authme.lnk"

  if (Test-Path -Path $shortcutPath) {
    Remove-Item $shortcutPath -ErrorAction SilentlyContinue -Force | Out-Null
  }
}

# the start menu folder for Authme is added by default on install - remove if /NoStartMenu has been specifed
if ($noStartMenu) {
  if ($pp.User) {
    $startMenuPath = [Environment]::GetFolderPath('StartMenu')
  } else {
    $startMenuPath = [Environment]::GetFolderPath('CommonStartMenu')
  }

  $shortcutPath = "$startMenuPath\Authme.lnk"

  if (Test-Path -Path $shortcutPath) {
    Remove-Item $shortcutPath -ErrorAction SilentlyContinue -Force | Out-Null
  }
}

$uninstallKey    = Get-UninstallRegistryKey -SoftwareName 'Authme'
$uninstallString = $uninstallKey.UninstallString

$uninstallString -match '(?<=")(?<InstallPath>[^\s]+)(?=Uninstall\s)'
$executable = '{0}{1}' -f $Matches.InstallPath, 'Authme.exe'

Install-Binfile -name 'authme' -path "$executable"
