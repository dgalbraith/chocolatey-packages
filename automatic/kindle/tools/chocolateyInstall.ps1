$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.us-east-1.amazonaws.com/70964/KindleForPC-installer-2.6.70964.exe'
  checksum      = 'b1988b305420c68bfde3952b9bda35d567fa0836f616a68e708779578819c9bf'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
