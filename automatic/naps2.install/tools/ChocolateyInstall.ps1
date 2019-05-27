$ErrorActionPreference = 'Stop';

$downloadUrl  = 'https://github.com/cyanfish/naps2/releases/download/v6.1.0/naps2-6.1.0-setup.msi'
$checksum     = '479FE5C57CFDF9C1938B83FC6F3EC3C7D57FF9532C232AE1B9077DFE7698BCB8'

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
