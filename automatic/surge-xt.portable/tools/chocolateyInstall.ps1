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
  url64          = 'https://github.com/surge-synthesizer/releases-xt/releases/download/1.3.4/surge-xt-win64-1.3.4-portable-install.zip'
  checksum64     = 'a5f2376702ad218c0382640ed0c7b9ebb222ba2410a210879899c0f726859d8e'
  checksumType64 = 'sha256'
  fileType       = 'zip'
  unzipLocation  = $unzipDir
}

Install-ChocolateyZipPackage @packageArgs
