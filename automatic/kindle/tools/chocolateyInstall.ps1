$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/62002/KindleForPC-installer-1.33.62002.exe'
  checksum      = '6f5616d9ccf8b76ce394a71ef5313aacfa833ade4e3cfcb2a61b35193d2d6b38'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
