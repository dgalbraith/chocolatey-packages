$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/70350/KindleForPC-installer-2.0.70350.exe'
  checksum      = '4dbb79bec0849b133a806db1009a763c2e4e2d561df09742af8bd98f1f98116a'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
