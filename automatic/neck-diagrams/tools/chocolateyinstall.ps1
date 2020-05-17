$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  softwareName  = 'Neck Diagrams*'
  url           = 'https://www.neckdiagrams.com/download-files/NeckDiagrams-2.1.0-Setup-32bit.exe'
  url64bit      = 'https://www.neckdiagrams.com/download-files/NeckDiagrams-2.1.0-Setup-64bit.exe'
  checksum      = '7db1574cb5c9050f000a36cd4f530766'
  checksumType  = 'MD5'
  checksum64    = 'c24bc030660aedfef93e9ae9645652e2'
  checksumType64= 'MD5'
  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
