$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

. ("$toolsDir/helpers.ps1")

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  $archive = Join-Path $toolsDir 'p95v303b6.win32.zip'
} else {
  $archive = Join-Path $toolsDir 'p95v303b6.win64.zip'
}

$packageArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @packageArgs

$pp = Get-PackageParameters

if ($pp.AddToDesktop) {
  Create-DesktopShortcut
}
