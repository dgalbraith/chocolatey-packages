$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  softwareName  = 'Neck Diagrams*'
  url           = 'https://www.neckdiagrams.com/download-files/NeckDiagrams-2.1.3-Setup-32bit.exe'
  url64bit      = 'https://www.neckdiagrams.com/download-files/NeckDiagrams-2.1.3-Setup-64bit.exe'
  checksum      = 'a2967df3228d8e0ebe8a3cfeb0a14d0c'
  checksumType  = 'MD5'
  checksum64    = '58538c35cbb2a400c4c441b32cf4a2e6'
  checksumType64= 'MD5'
  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
