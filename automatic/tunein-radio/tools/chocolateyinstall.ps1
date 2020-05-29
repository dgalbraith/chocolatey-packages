$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  softwareName   = 'TuneIn*'
  url            = 'https://gemini-desktop-prod.s3-us-west-2.amazonaws.com/release/TuneIn+Setup+1.18.0.exe'
  checksum       = '952924c1bd01486a706f448c405dd601257026618f01e29a088df7f2f3ddbdf1'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
