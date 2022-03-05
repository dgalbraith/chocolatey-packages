$ErrorActionPreference = 'Stop'

$dbgateLink      = 'dbgate.lnk'

$desktop         = [Environment]::GetFolderPath('Desktop')
$commonDesktop   = [Environment]::GetFolderPath('CommonDesktopDirectory')
$startMenu       = [Environment]::GetFolderPath('StartMenu')
$commonStartMenu = [Environment]::GetFolderPath('CommonStartMenu')

$paths = @(
  (Join-Path $desktop $dbgateLink),
  (Join-Path $commonDesktop $dbgateLink),
  (Join-Path $startMenu $dbgateLink),
  (Join-Path $commonStartMenu $dbgateLink)
)

$paths.GetEnumerator() | ForEach-Object {
  if (Test-Path -Path $_) {
    Remove-Item $_ -ErrorAction SilentlyContinue -Force | Out-Null
  }
}
