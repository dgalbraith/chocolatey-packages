$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://s3.amazonaws.com/kindleforpc/60170/KindleForPC-installer-1.31.60170.exe'
  checksum      = '3c5eaace1a3db0e67231791181b24174fa2978b2b37ff6a25d238299c1cb29da'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
