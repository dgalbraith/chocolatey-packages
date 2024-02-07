$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/70682/KindleForPC-installer-2.3.70682.exe'
  checksum      = 'd11076f6d94cef9d74534e85da7eba0c879bb924e0dbd4c27c718c4d9ca3c9aa'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
