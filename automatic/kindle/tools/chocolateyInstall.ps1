$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/70471/KindleForPC-installer-2.1.70471.exe'
  checksum      = 'e8ca476a80603fb7728841c40a52a31380c336c018007a9e7acb4de6f0330dfa'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
