$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  softwareName   = 'TuneIn*'
  url            = 'https://cdn-desktop.tunein.com/release/TuneIn-Setup-1.33.0.exe'
  checksum       = '92a51d334265070ec66d65c59a494126b4d8b65ad799039d117784823de65f64'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
