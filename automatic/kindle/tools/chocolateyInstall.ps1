$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.us-east-1.amazonaws.com/70995/KindleForPC-installer-2.8.70995.exe'
  checksum      = 'e5bda18ad4d57999de18372c94416c99bf85c7183d99ba52b2982df8fbe119e0'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
