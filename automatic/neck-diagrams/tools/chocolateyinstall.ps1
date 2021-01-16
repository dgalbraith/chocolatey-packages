$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  softwareName  = 'Neck Diagrams*'
  url           = 'https://www.neckdiagrams.com/download-files/NeckDiagrams-2.2.0-Setup-32bit.exe'
  url64bit      = 'https://www.neckdiagrams.com/download-files/NeckDiagrams-2.2.0-Setup-64bit.exe'
  checksum      = '305fcbfa28769c9c0f1f2cf1c9ae3037'
  checksumType  = 'MD5'
  checksum64    = '394bcaefbfdafedde634b185ab145f8a'
  checksumType64= 'MD5'
  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
