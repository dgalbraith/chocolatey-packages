$ErrorActionPreference = 'Stop'

$link = 'Remote Desktop.lnk'

$desktop       = [Environment]::GetFolderPath('Desktop')
$commonDesktop = [Environment]::GetFolderPath('CommonDesktopDirectory')

$paths = @(
  (Join-Path $desktop $link),
  (Join-Path $commonDesktop $link)
)

$paths.GetEnumerator() | ForEach-Object {
  if (Test-Path -Path $_) {
    Remove-Item $_ -ErrorAction SilentlyContinue -Force | Out-Null
  }
}
