$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/70301/KindleForPC-installer-2.0.70301.exe'
  checksum      = 'ccc076eef4eac9b0fa7ec541cc13be637b661b46b3a5bf9d77759ba7b6cd9b54'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
