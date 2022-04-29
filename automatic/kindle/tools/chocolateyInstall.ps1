$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/65107/KindleForPC-installer-1.36.65107.exe'
  checksum      = '1c3879dda9b11f96e7232896e6fab0168c7536fd966594f1f4072df536bd0fd5'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
