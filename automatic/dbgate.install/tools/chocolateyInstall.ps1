$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$installer = Join-Path $toolsDir 'dbgate-7.0.0-win_x64.exe'

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  File           = $installer
  FileType       = 'exe'
  SilentArgs     = '/S'
  ValidExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs

$uninstallKey    = Get-UninstallRegistryKey -SoftwareName 'dbgate*'
$installLocation = $uninstallKey.DisplayIcon

$executable = $installLocation -split ',' | Select-Object -first 1

$pp = Get-PackageParameters

if ($pp.AddToDesktop) {
  $desktopPath  = [Environment]::GetFolderPath('Desktop')
  $shortcutPath = Join-Path $desktopPath 'dbgate.lnk'

  Write-Verbose("Adding shortcut to $dbgateShortcutPath to desktop")
  Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $executable
}

# the start menu folder for DbGate is added by default on install - remove if /NoStartMenu has been specifed
if ($pp.NoStartMenu) {
  $startMenuPath      = [Environment]::GetFolderPath('CommonPrograms')
  $dbgateShortcutPath = "$startMenuPath\dbgate.lnk"

  if (Test-Path -Path $dbgateShortcutPath) {
    Write-Verbose("Removing start menu folder $dbgateShortcutPath")
    Remove-Item $dbgateShortcutPath -ErrorAction SilentlyContinue -Force | Out-Null
  }
}

Install-Binfile -name 'dbgate' -path "$executable"
