$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.us-east-1.amazonaws.com/70987/KindleForPC-installer-2.8.70987.exe'
  checksum      = 'f870ee876a40d9957925525bbf96b229a960d6a2fc394e2b03a183d12e0203f0'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
