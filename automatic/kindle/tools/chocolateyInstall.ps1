$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/65415/KindleForPC-installer-1.40.65415.exe'
  checksum      = '67e31b8e45b9a537ad3ff64c65cbcb5de4e5b5569c28922daf5ba29983d87bc2'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
