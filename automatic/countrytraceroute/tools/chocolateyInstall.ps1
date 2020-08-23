$ErrorActionPreference = 'Stop';

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$archive = Join-Path $toolsDir 'countrytraceroute.zip'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs
