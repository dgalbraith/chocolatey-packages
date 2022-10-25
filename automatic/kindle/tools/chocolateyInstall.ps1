$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/65323/KindleForPC-installer-1.39.65323.exe'
  checksum      = '30363931fe21070d95dc846695759e370f9961391b15a94460c641844650f0f6'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
