$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://s3.amazonaws.com/kindlepreviewer3/KindlePreviewerInstaller.exe'
  checksum      = 'f1c8238a0143b8486841dbd8b849778cd1922e7b99d98ea567862f9c353ecb2f'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
