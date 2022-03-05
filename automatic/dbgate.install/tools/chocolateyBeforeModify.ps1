$ErrorActionPreference = 'Stop'

$dbgateLink      = 'dbgate.lnk'

$desktop         = [Environment]::GetFolderPath('Desktop')

$paths = @(
  (Join-Path $desktop $dbgateLink)
)

$paths.GetEnumerator() | ForEach-Object {
  if (Test-Path -Path $_) {
    Remove-Item $_ -ErrorAction SilentlyContinue -Force | Out-Null
  }
}
