$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.us-east-1.amazonaws.com/70980/KindleForPC-installer-2.8.70980.exe'
  checksum      = '2ed64ee0fb5ad94032d6d9824d4efbeeea435255c963e9393d949259b87ebfa4'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
