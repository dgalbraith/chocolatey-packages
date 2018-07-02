$ErrorActionPreference = 'Stop';

$downloadUrl  = 'https://github.com/cyanfish/naps2/releases/download/v5.8.2/naps2-5.8.2-setup.msi'
$checksum     = '6EEA6A85D15725D2D21BD46B0CD4E91A9FB47E5E7D09225DE05489DEB98D9A94'

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
