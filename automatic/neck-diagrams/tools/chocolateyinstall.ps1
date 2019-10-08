$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  softwareName  = 'Neck Diagrams*'
  url           = 'https://www.neckdiagrams.com/download-files/NeckDiagrams-2.0.3-Setup-32bit.exe'
  url64bit      = 'https://www.neckdiagrams.com/download-files/NeckDiagrams-2.0.3-Setup-64bit.exe'
  checksum      = '215bbe276c7d3a04a390ebc15c29d874'
  checksumType  = 'MD5'
  checksum64    = '03670bdaab22236117206c34befb9212'
  checksumType64= 'MD5'
  silentArgs   = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
