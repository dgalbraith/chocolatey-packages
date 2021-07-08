$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://s3.amazonaws.com/kindleforpc/61109/KindleForPC-installer-1.32.61109.exe'
  checksum      = '1d027c1b73163d4d3c7ce0c731b6c1daeb4ba27accedd3578c798dad20c73c78'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
