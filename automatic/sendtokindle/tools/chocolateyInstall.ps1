$ErrorActionPreference = 'Stop'

Set-Service -Name 'Spooler' -StartupType 'Automatic'

$url      = 'https://s3.amazonaws.com/sendtokindle/SendToKindleForPC-installer.exe'
$checksum = '9F828E94884ED1AA2C7634183783538EF5E493402F3C9F6A97F690F47BD045B3'

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileType       = 'exe'
  Url            = $url
  Checksum       = $checksum
  SilentArgs     = '/S'
  ValidExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
