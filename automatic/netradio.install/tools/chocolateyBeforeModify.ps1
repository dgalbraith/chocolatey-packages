$ErrorActionPreference = 'Stop'

$desktopPath  = [Environment]::GetFolderPath('CommonDesktopDirectory')
$shortcutPath = "$desktopPath\NetRadio.lnk"

if (Test-Path -Path $shortcutPath) {
    Remove-Item $shortcutPath -ErrorAction SilentlyContinue -Force | Out-Null
}
