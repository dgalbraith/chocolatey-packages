$ErrorActionPreference = 'Stop';

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  Write-Error -Message "32-bit version of MongoDB Shell not available" -Category ResourceUnavailable
}

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$archive = Join-Path $toolsDir 'mongosh-2.2.2-win32-x64.zip'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs
