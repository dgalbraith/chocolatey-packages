$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/65290/KindleForPC-installer-1.38.65290.exe'
  checksum      = '44f04a311b99e0d7f0bf04b7a01699993e49a2ebac6364ef91798482f1a3e8f8'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
