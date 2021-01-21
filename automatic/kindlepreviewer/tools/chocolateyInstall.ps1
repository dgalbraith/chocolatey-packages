$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://s3.amazonaws.com/kindlepreviewer3/KindlePreviewerInstaller.exe'
  checksum      = '8474d50d7ae57f2e7274f6c9aae236eeeb9950c4b66291c949fcd1411ba86838'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
