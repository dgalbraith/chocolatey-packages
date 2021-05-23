$ErrorActionPreference = 'Stop'

$nethackLink        = 'Nethack.lnk'
$nethackClassicLink = 'Nethack (Classic).lnk'

$desktop         = [Environment]::GetFolderPath('Desktop')
$commonDesktop   = [Environment]::GetFolderPath('CommonDesktopDirectory')
$startMenu       = [Environment]::GetFolderPath('StartMenu')
$commonStartMenu = [Environment]::GetFolderPath('CommonStartMenu')

$paths = @(
  (Join-Path $desktop $nethackLink),
  (Join-Path $desktop $nethackClassicLink),
  (Join-Path $commonDesktop $nethackLink),
  (Join-Path $commonDesktop $nethackClassicLink),
  (Join-Path $startMenu 'NetHack' | Join-Path -childpath $nethackLink),
  (Join-Path $startMenu 'NetHack' | Join-Path -childpath $nethackClassicLink),
  (Join-Path $startMenu 'NetHack'),
  (Join-Path $commonStartMenu 'NetHack' | Join-Path -childpath $nethackLink),
  (Join-Path $commonStartMenu 'NetHack' | Join-Path -childpath $nethackClassicLink)
  (Join-Path $commonStartMenu 'NetHack')
)

$paths.GetEnumerator() | ForEach-Object {
  if (Test-Path -Path $_) {
    Remove-Item $_ -ErrorAction SilentlyContinue -Force | Out-Null
  }
}