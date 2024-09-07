$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/70951/KindleForPC-installer-2.5.70951.exe'
  checksum      = '2df949a98aa90bf05e87d69755e1fec3dab8fa40458a768debc3444777a13541'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
