$ErrorActionPreference = 'Stop'

$netradioLink    = 'NetRadio.lnk'
$desktop         = [Environment]::GetFolderPath('Desktop')
$commonDesktop   = [Environment]::GetFolderPath('CommonDesktopDirectory')
$startMenu       = [Environment]::GetFolderPath('StartMenu')
$commonStartMenu = [Environment]::GetFolderPath('CommonStartMenu')

$paths = @(
  (Join-Path $desktop $netradioLink),
  (Join-Path $commonDesktop $netradioLink),
  (Join-Path $startMenu $netradioLink),
  (Join-Path $commonStartMenu $netradioLink)
)

$paths.GetEnumerator() | ForEach-Object {
  if (Test-Path -Path $_) {
    Remove-Item $_ -ErrorAction SilentlyContinue -Force | Out-Null
  }
}
