$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://kindleforpc.s3.amazonaws.com/65274/KindleForPC-installer-1.37.65274.exe'
  checksum      = '11f6501142960337f7106ce6acfe9ec26d6d3289c5190b3f154272b2517de760'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
