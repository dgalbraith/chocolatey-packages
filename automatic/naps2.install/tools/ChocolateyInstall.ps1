$ErrorActionPreference = 'Stop';

$downloadUrl  = 'https://github.com/cyanfish/naps2/releases/download/v6.1.2/naps2-6.1.2-setup.msi'
$checksum     = 'A3AE684694FEDBBC557208320DF571EABE5B4099A4D26C0AC00AAF6EBAB09238'

$packageArgs = @{
  packageName    = "naps2.install"
  softwareName   = "NAPS2 (Not Another PDF Scanner 2)"
  url            = $downloadUrl
  checksum       = $checksum
  checksumType   = 'sha256'
  fileType       = 'msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
