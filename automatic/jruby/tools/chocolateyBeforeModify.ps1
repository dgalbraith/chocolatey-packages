$ErrorActionPreference = 'Stop'

$desktopPath  = [Environment]::GetFolderPath("Desktop")
$shortcutPath = "$desktopPath\JRuby IRB Console.lnk"

if (Test-Path -Path $shortcutPath) {
  Remove-Item $shortcutPath -ErrorAction SilentlyContinue -Force | Out-Null
}
