$ErrorActionPreference = 'Stop'

Set-Service -Name 'Spooler' -StartupType 'Automatic'

$url      = 'http://s3.amazonaws.com/sendtokindle/SendToKindleForPC-installer.exe'
$checksum = '38A173669B3056F1C81E24145153BE2B781C2C9E44E0EAFD01E5C93D6DEEB1F0'

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'exe'
  url64bit     = $url
  checksum     = $checksum
  checksumType = 'sha256'
  silentArgs   = '/S'
  validExitCodes= @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
