$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url32          = 'https://www.neckdiagrams.com/download-files/NeckDiagrams-2.4.2-Setup-32bit.exe'
  url64          = 'https://www.neckdiagrams.com/download-files/NeckDiagrams-2.4.2-Setup-64bit.exe'
  checksum32     = '637b3a60defc07844a1fff1c06b8fd5783436197448eff70276daba73dfc6ba3'
  checksumType32 = 'sha256'
  checksum64     = 'c335e8bb8802f5796e6fd3a5be4d2caeabbbf06e5dec296de3d7a56f554ac3cb'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
