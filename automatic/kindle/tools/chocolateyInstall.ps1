$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/63103/KindleForPC-installer-1.34.63103.exe'
  checksum      = '3dc62b3895954fc171d4a3d08f2b7a1a503233e373c163adb7bc7fd34cdeff49'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
