$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/70623/KindleForPC-installer-2.2.70623.exe'
  checksum      = '2e305718c11515d6202d31980c15f685d7a98201e75cf5a423db8ab88f60c181'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
