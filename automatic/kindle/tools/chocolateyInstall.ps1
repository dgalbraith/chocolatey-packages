$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/65383/KindleForPC-installer-1.39.65383.exe'
  checksum      = '8190f52ea85a01f35b3f7d0280321497b53bd74c8b8fa68111c48b093f3c0c7f'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
