$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url32          = 'https://neckdiagrams.com/download-files/NeckDiagrams-2.3.4-Setup-32bit.exe'
  url64          = 'https://neckdiagrams.com/download-files/NeckDiagrams-2.3.4-Setup-64bit.exe'
  checksum32     = '6ad036df24b986d6c59d42286b5ff2dcb84f51ba1fd880bd05b657fcaa9139bd'
  checksumType32 = 'sha256'
  checksum64     = '0cbe5ff94834f2eaea4219946b0f0ca8e677347c84504d56ac045466fba07862'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
