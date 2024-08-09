$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/70946/KindleForPC-installer-2.4.70946.exe'
  checksum      = '37f4aab2c87d68214bdea017a62c6bafe7fabb2f1d9dc151f9e6c4ce1f232413'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
