$ErrorActionPreference = 'Stop'

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  Write-Error -Message "32-bit version of Watchman not available" -Category ResourceUnavailable
}

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$archive = Join-Path $toolsDir 'watchman-v2022.05.16.00-windows.zip'

$unzipArgs = @{
  PackageName = $env:ChocolateyPackageName
  File64      = $archive
  Destination = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs
