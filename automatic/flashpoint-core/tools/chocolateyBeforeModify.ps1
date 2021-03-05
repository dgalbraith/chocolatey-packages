$ErrorActionPreference = 'Stop'

$desktopPath  = [Environment]::GetFolderPath("Desktop")
$shortcutPath = Join-Path $desktopPath 'Flashpoint Core.lnk'

if (Test-Path $shortcutPath) {
  Remove-Item -Path $shortcutPath -Force | Out-Null
}
