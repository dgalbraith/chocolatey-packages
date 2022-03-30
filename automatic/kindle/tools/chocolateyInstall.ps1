$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/64251/KindleForPC-installer-1.35.64251.exe'
  checksum      = '48828d9cff9cc07d8725c9c20d4894fb50e0fc83e0391757bc552c403e4c436a'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
