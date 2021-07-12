$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

if ((Get-ProcessorBits 32) -eq 'true' -or $env:ChocolateyForceX86 -eq 'true') {
  $archive = Join-Path $toolsDir 'fluidsynth-2.2.2-winXP-x86.zip'
}
else {
  $archive = Join-Path $toolsDir 'fluidsynth-2.2.2-win10-x64.zip'
}

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs
