$ErrorActionPreference = 'Stop'

Set-Service -Name 'Spooler' -StartupType 'Automatic'

$url      = 'https://s3.amazonaws.com/sendtokindle/SendToKindleForPC-installer.exe'
$checksum = '31CE44DEDBA1E0A2BD5146603C401F244ECF3DFD9E113416DDEA5E574077082A'

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileType       = 'exe'
  Url            = $url
  Checksum       = $checksum
  SilentArgs     = '/S'
  ValidExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
