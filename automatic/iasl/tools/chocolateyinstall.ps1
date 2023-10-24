$ErrorActionPreference = 'Stop'

$toolsDir  = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$archive = Join-Path $toolsDir 'iasl-win-20230628.zip'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs
