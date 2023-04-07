$ErrorActionPreference = 'Stop'

Set-Service -Name 'Spooler' -StartupType 'Automatic'

$url      = 'https://s3.amazonaws.com/sendtokindle/SendToKindleForPC-installer.exe'
$checksum = '869409B9665BD445C8B332EF468C4FBD23FEFD38827875EFD201C791C92E4940'

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileType       = 'exe'
  Url            = $url
  Checksum       = $checksum
  SilentArgs     = '/S'
  ValidExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
