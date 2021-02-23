$ErrorActionPreference = 'Stop'

$launchScript = "Flashpoint.cmd"

Uninstall-BinFile -Name 'Flashpoint' -Path $launchScript

$desktopPath  = [Environment]::GetFolderPath("Desktop")
$executable   = Get-ChildItem $toolsDir -Include 'Flashpoint.exe' -Recurse
$shortcutPath = Join-Path $desktopPath $executable.Name.Replace($executable.Extension, '.lnk')

if (Test-Path $shortcutPath) {
  Remove-Item -Path $shortcutPath -Force | Out-Null
}
