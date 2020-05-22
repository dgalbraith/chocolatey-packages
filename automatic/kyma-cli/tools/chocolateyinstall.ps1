$ErrorActionPreference = 'Stop';

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  $archive = Join-Path $toolsDir 'kyma_Windows_i386.zip'
}
else {
  $archive = Join-Path $toolsDir 'kyma_Windows_x86_64.zip'
}

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs
