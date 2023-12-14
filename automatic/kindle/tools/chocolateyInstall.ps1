$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/70673/KindleForPC-installer-2.3.70673.exe'
  checksum      = '8b76c1dd86f5e8e4224466103e60cc58e1cdf94d5a00f1d87f7bf33459e7013a'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
