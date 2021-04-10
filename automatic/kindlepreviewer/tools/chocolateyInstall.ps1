$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://s3.amazonaws.com/kindlepreviewer3/KindlePreviewerInstaller.exe'
  checksum      = '6546d42d77447d442f6cf968fb976c9b8cb5cf116a89661a9745c657c2acea4d'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
