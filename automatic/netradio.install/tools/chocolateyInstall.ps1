$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  softwareName   = 'NetRadio'
  file64         = "$toolsDir\NetRadioSetup.exe"
  silentArgs     = $silentArgs
  validExitCodes = @(0)
}

Start-Process 'AutoHotKey' "$toolsDir\chocolateyInstall.ahk"

Install-ChocolateyInstallPackage @packageArgs  

$uninstallKey = Get-UninstallRegistryKey -SoftwareName 'netradio*'
$executable   = Join-Path $uninstallKey.InstallLocation 'NetRadio.exe'

Install-Binfile -Name 'NetRadio' -Path $executable -UseStart

$pp = Get-PackageParameters

# the desktop shortcut for is added by default for the installing user - remove
$desktopPath = [Environment]::GetFolderPath('Desktop')
$shortcutPath = "$desktopPath\NetRadio.lnk"
Remove-Item $shortcutPath -ErrorAction SilentlyContinue -Force | Out-Null

# add the desktop shortcut for all users if requested
if ($pp.AddToDesktop) {
  $desktopPath    = [Environment]::GetFolderPath('CommonDesktopDirectory')
  $shortcutPath   = "$desktopPath\NetRadio.lnk"

  Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $executable -WorkingDirectory '%userprofile%'
}

# the start menu is added by default on install - remove if /AddToStart has not been specifed
if (-not $pp.AddToStart) {
  $startMenuPath = [Environment]::GetFolderPath('CommonStartMenu')
  $shortcutPath = "$startMenuPath\NetRadio.lnk"

  if (Test-Path -Path $shortcutPath) {
    Remove-Item $shortcutPath -ErrorAction SilentlyContinue -Force | Out-Null
  } 
}
