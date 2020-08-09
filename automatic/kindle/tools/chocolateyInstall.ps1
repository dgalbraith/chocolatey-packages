$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://s3.amazonaws.com/kindleforpc/58059/KindleForPC-installer-1.29.58059.exe'
  checksum      = '09b4d9cab09b7d59384ac83436d0cbe22e6514ec373e02b315ad9a3ed6047d5e'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
