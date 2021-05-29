$ErrorActionPreference = 'Stop'

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileType       = 'msi'
  Url            = 'https://download.microsoft.com/download/6/5/8/658AFC4C-DC02-4CB8-839D-10253E89FFF7/MouseWithoutBordersSetup.msi'
  Checksum       = '52ee7f6ddcd934ac50c937db06820e7ea6cb1a3908c6431b8b0bcb1e641712cb'
  ChecksumType   = 'sha256'
  SilentArgs     = '/quiet /qn /norestart'
  ValidExitCodes = @(0, 1605)
}

Install-ChocolateyPackage @packageArgs
