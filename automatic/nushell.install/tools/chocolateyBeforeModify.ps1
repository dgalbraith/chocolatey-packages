$ErrorActionPreference = 'Stop'

$link = 'Nu Shell.lnk'

$desktop         = [Environment]::GetFolderPath('Desktop')
$commonDesktop   = [Environment]::GetFolderPath('CommonDesktopDirectory')
$startMenu       = [Environment]::GetFolderPath('StartMenu')
$commonStartMenu = [Environment]::GetFolderPath('CommonStartMenu')

$paths = @(
  (Join-Path $desktop $link),
  (Join-Path $commonDesktop $link),
  (Join-Path $startMenu $link),
  (Join-Path $commonStartMenu $link)
)

$paths.GetEnumerator() | ForEach-Object {
  if (Test-Path -Path $_) {
    Remove-Item $_ -ErrorAction SilentlyContinue -Force | Out-Null
  }
}
