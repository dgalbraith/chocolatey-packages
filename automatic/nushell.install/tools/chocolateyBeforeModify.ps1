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

$uninstallKey = Get-UninstallRegistryKey -SoftwareName 'Nushell'

if ($uninstallKey) {
  $installLocation = $uninstallKey.InstallLocation

  if (($installLocation) -and ($installLocation -ne '') -and (Test-Path $installLocation)) {
    Get-ChildItem -Path $installLocation -Recurse -Filter '*.exe' | foreach-object {
      Uninstall-BinFile -Name ($_.Name -Replace '\.exe$','') -Path $_.FullName
    }
  }
} else {
  Write-Error "The uninstall key could not be found - shims have not been automatically removed."
}
