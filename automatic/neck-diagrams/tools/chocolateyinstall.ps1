$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url32          = 'https://www.neckdiagrams.com/download-files/NeckDiagrams-2.4.1-Setup-32bit.exe'
  url64          = 'https://www.neckdiagrams.com/download-files/NeckDiagrams-2.4.1-Setup-64bit.exe'
  checksum32     = 'eb13a51fe100780ca9accde858141dc682e8985241a824521949e70c6f3560d3'
  checksumType32 = 'sha256'
  checksum64     = 'b53a4b73585889337a087abc6ccdbe8439068daf4b53aad91cfe9509a87925e1'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
