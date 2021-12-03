$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  softwareName   = 'TuneIn*'
  url            = 'https://cdn-desktop.tunein.com/release/TuneIn+Setup+1.24.0.exe'
  checksum       = '15a11239578693ca64aa0dd4dcad5f049da117e8c785718b0a4f87cfad127b2d'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
