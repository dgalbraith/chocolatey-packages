$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/65535/KindleForPC-installer-1.40.65535.exe'
  checksum      = '03d4ca7a54ea01b1c0405e26e31008ef70ee19c1b13957badb661898528f724b'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
