$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  softwareName   = 'TuneIn*'
  url            = 'https://cdn-desktop.tunein.com/release/TuneIn-Setup-1.34.0.exe'
  checksum       = '6fe9711636dab50b397aea801716ade9dea5df25b7b880c91a99aeb8b864cc09'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
