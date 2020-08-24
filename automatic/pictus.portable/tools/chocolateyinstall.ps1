$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$archive   = Join-Path $toolsDir 'pictus32.zip'
$archive64 = Join-Path $toolsDir 'pictus64.zip'

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileFullPath   = $archive
  FileFullPath64 = $archive64
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @packageArgs
