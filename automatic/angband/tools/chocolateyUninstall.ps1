$ErrorActionPreference = 'Stop'

Uninstall-BinFile -Name 'angband' -Path 'angband.exe'

$installDir  = Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName
$instance    = '{0}-{1}' -f $Env:ChocolateyPackageName, $Env:ChocolateyPackageVersion
$instanceDir = Join-Path $installDir $instance

Remove-Item $instanceDir -Force  -Recurse -ErrorAction SilentlyContinue | Out-Null

if ((Get-ChildItem -Recurse -Attributes !Directory $installDir | Measure-Object).Count -eq 0) {
  Remove-Item $installDir -Force  -Recurse -ErrorAction SilentlyContinue | Out-Null
}
