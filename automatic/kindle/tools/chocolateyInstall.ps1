$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/65306/KindleForPC-installer-1.39.65306.exe'
  checksum      = 'c1e53345295902e944850b1aa8d9ffa751bcbbf422aa4a096d4d934b5e9916cb'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
