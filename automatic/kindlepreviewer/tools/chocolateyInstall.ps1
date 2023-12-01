$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://d2bzeorukaqrvt.cloudfront.net/KindlePreviewerInstaller.exe'
  checksum      = '83b882d47916c9d7b2deaf437eed738bcc52bc3ba8c7e53227eedf9668e46858'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
