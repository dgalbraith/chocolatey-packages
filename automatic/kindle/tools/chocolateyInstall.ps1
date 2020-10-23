$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://s3.amazonaws.com/kindleforpc/59056/KindleForPC-installer-1.30.59056.exe'
  checksum      = 'f4484348e60395386096ee1d75c7b3e73b43cd7b2a8d37d07ff89ddb43b26733'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
