$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.us-east-1.amazonaws.com/70978/KindleForPC-installer-2.7.70978.exe'
  checksum      = '0a2dc0db4c32970d7d72a3c3e9e5e48aa34c2fad56dd11ad9e55a7ef11d71e84'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
