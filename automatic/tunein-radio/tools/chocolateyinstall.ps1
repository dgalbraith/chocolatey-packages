$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  softwareName   = 'TuneIn*'
  url            = 'https://gemini-desktop-prod.s3-us-west-2.amazonaws.com/release/TuneIn+Setup+1.19.0.exe'
  checksum       = '2e1a58bdadf26b5e989130dff7b216e36c6ed9da97d2acfd65853a2de6d562a8'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
