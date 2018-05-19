$ErrorActionPreference = 'Stop';

$downloadUrl  = 'https://github.com/cyanfish/naps2/releases/download/v5.3.0/naps2-5.3.0-setup.msi'
$checksum     = '7BB083199D165C50E06A604C4CD86FE939CF02CA99364D832A497BCDBEF5A53B'

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
