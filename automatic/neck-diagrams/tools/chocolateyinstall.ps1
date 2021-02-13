$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  softwareName  = 'Neck Diagrams*'
  url           = 'https://www.neckdiagrams.com/download-files/NeckDiagrams-2.2.1-Setup-32bit.exe'
  url64bit      = 'https://www.neckdiagrams.com/download-files/NeckDiagrams-2.2.1-Setup-64bit.exe'
  checksum      = '7be3e0b9d5701c9bf1c243c66b37aff1'
  checksumType  = 'MD5'
  checksum64    = 'baf8ab4edff1604ba6cb81b5b98aa335'
  checksumType64= 'MD5'
  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
