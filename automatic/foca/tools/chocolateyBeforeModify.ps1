$ErrorActionPreference = 'Stop'

$focaLink        = 'FOCA.lnk'

$desktop         = [Environment]::GetFolderPath('Desktop')
$commonDesktop   = [Environment]::GetFolderPath('CommonDesktopDirectory')
$startMenu       = [Environment]::GetFolderPath('StartMenu')
$commonStartMenu = [Environment]::GetFolderPath('CommonStartMenu')

$paths = @(
  (Join-Path $desktop $focaLink),
  (Join-Path $commonDesktop $focaLink),
  (Join-Path $startMenu $focaLink),
  (Join-Path $commonStartMenu $focaLink)
)

$paths.GetEnumerator() | ForEach-Object {
  if (Test-Path -Path $_) {
    Remove-Item $_ -ErrorAction SilentlyContinue -Force | Out-Null
  }
}