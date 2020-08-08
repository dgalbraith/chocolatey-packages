$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://s3.amazonaws.com/kindleforpc/57030/KindleForPC-installer-1.28.57030.exe'
  checksum      = '6FEEA6EC44FF3D3B7BE23E7A969FE14AB884A7B19E23BC2C74237730411559F6'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
