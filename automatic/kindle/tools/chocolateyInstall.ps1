$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/70904/KindleForPC-installer-2.4.70904.exe'
  checksum      = '2e2e4e5bb9fd585947244a4a62ce5baca47818c439d0213cc9a5a96f9a692119'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
