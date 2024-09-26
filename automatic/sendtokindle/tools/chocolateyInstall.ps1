$ErrorActionPreference = 'Stop'

Set-Service -Name 'Spooler' -StartupType 'Automatic'

$url      = 'https://s3.amazonaws.com/sendtokindle/SendToKindleForPC-installer.exe'
$checksum = 'CC688D26FBFD128FB46D72800DBBAE3D307649BDC0C1CC04D738780FB895799B'

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileType       = 'exe'
  Url            = $url
  Checksum       = $checksum
  SilentArgs     = '/S'
  ValidExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
