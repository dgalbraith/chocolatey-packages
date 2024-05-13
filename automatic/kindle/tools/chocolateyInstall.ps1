$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/70840/KindleForPC-installer-2.3.70840.exe'
  checksum      = 'bc8e142402d72db80a27028b4c4c0b0531284647e386108481288466a8c9755e'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
