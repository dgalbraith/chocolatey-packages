$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url32          = 'https://neckdiagrams.com/download-files/NeckDiagrams-2.4.0-Setup-32bit.exe'
  url64          = 'https://neckdiagrams.com/download-files/NeckDiagrams-2.4.0-Setup-64bit.exe'
  checksum32     = 'dbd7e7fd765a2ffb834121ee6013d30d6f61ffd13dcd3fcddf447eb111c22a55'
  checksumType32 = 'sha256'
  checksum64     = 'af00022244089157b52bf55b45d93488e29af8b6a2d658963f7e8f6ac22005db'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
