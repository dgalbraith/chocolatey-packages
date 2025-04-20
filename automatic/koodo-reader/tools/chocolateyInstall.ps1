$ErrorActionPreference = 'Stop'

$toolsDir   = Split-Path -parent $MyInvocation.MyCommand.Definition

$installer  = Join-Path $toolsDir 'Koodo-Reader-1.9.4.exe'
$silentArgs = '/S /AllUsers'

$pp = Get-PackageParameters

if ($pp.User) {
  $silentArgs = $silentArgs.Replace('AllUsers','CurrentUser')
}

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  File           = $installer
  FileType       = 'exe'
  SilentArgs     = $silentArgs
  ValidExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs

# the desktop shortcut for Koodo Reader is added by default on install - remove unless retention has been specified with /AddToDesktop
if (-not $addToDesktop) {
  if ($pp.User) {
    $desktopPath = [Environment]::GetFolderPath('Desktop')
  } else {
    $desktopPath = [Environment]::GetFolderPath('CommonDesktopDirectory')
  }

  $shortcutPath = "$desktopPath\Koodo Reader.lnk"

  if (Test-Path -Path $shortcutPath) {
    Remove-Item $shortcutPath -ErrorAction SilentlyContinue -Force | Out-Null
  }
}

# the start menu folder for Koodo Reader is added by default on install - remove if /NoStartMenu has been specifed
if ($noStartMenu) {
  if ($pp.User) {
    $startMenuPath = [Environment]::GetFolderPath('StartMenu')
  } else {
    $startMenuPath = [Environment]::GetFolderPath('CommonStartMenu')
  }

  $shortcutPath = "$startMenuPath\Koodo Reader.lnk"

  if (Test-Path -Path $shortcutPath) {
    Remove-Item $shortcutPath -ErrorAction SilentlyContinue -Force | Out-Null
  }
}

$uninstallKey    = Get-UninstallRegistryKey -SoftwareName 'Koodo Reader*'
$uninstallString = $uninstallKey.UninstallString

$installPath = $uninstallString -match '(?<=")(?<InstallPath>.+)(?=Uninstall\s)' | ForEach-Object { $Matches.InstallPath }
$executable = '{0}{1}' -f $installPath, 'Koodo Reader.exe'

Install-Binfile -name 'Koodo Reader' -path "$executable"
