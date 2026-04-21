$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.us-east-1.amazonaws.com/71006/KindleForPC-installer-2.9.71006.exe'
  checksum      = '8e3bff714de9a8e3cad0f8072e3150df0d419e4a08b54f9ef91bcded7c2ef4ef'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
