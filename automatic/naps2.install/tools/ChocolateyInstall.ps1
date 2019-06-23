$ErrorActionPreference = 'Stop';

$downloadUrl  = 'https://github.com/cyanfish/naps2/releases/download/v6.1.1/naps2-6.1.1-setup.msi'
$checksum     = '090F194398469B09C3A44A35BDE8E78EAA71AD2A86C249D802B554D748219177'

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
