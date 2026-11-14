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

# remove the bin directory from the path - the installer only removes the entry it added itself
$uninstallKey = Get-UninstallRegistryKey -SoftwareName 'Nushell' -ErrorAction SilentlyContinue

if (($uninstallKey) -and ($uninstallKey.InstallLocation)) {
  $binDir = (Join-Path $uninstallKey.InstallLocation 'bin').TrimEnd('\')

  foreach ($scope in 'Machine', 'User') {
    $path      = Get-EnvironmentVariable -Name 'Path' -Scope $scope -PreserveVariables
    $entries   = @($path -split ';' | Where-Object { $_ })
    $remaining = @($entries | Where-Object { $_.TrimEnd('\') -ne $binDir })

    if ($remaining.Count -ne $entries.Count) {
      Install-ChocolateyEnvironmentVariable -VariableName 'Path' -VariableValue ($remaining -join ';') -VariableType $scope
    }
  }
}
