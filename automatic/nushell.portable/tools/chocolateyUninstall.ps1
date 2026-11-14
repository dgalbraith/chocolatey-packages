$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

# remove the tools directory from the path - it may have been added to either scope
foreach ($scope in 'Machine', 'User') {
  $path      = Get-EnvironmentVariable -Name 'Path' -Scope $scope -PreserveVariables
  $entries   = @($path -split ';' | Where-Object { $_ })
  $remaining = @($entries | Where-Object { $_.TrimEnd('\') -ne $toolsDir.TrimEnd('\') })

  if ($remaining.Count -ne $entries.Count) {
    Install-ChocolateyEnvironmentVariable -VariableName 'Path' -VariableValue ($remaining -join ';') -VariableType $scope
  }
}
