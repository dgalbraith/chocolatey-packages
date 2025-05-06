$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$pp = Get-PackageParameters

if ($pp.InstallDir) {
  $unzipDir = $pp.InstallDir
} else {
  $unzipDir = $toolsDir
}

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/surge-synthesizer/releases-xt/releases/download/1.3.3/surge-xt-win64-1.3.3-portable-install.zip'
  checksum64     = '8817d3f0c6d55e33f37f9b5d1ca8cb4cb7e288626c7bebd721a4e547710c2e68'
  checksumType64 = 'sha256'
  fileType       = 'zip'
  unzipLocation  = $unzipDir
}

Install-ChocolateyZipPackage @packageArgs