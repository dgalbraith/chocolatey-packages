$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url32          = 'https://www.neckdiagrams.com/download-files/NeckDiagrams-2.2.1-Setup-32bit.exe'
  url64          = 'https://www.neckdiagrams.com/download-files/NeckDiagrams-2.2.1-Setup-64bit.exe'
  checksum32     = '7be3e0b9d5701c9bf1c243c66b37aff1'
  checksumType32 = 'sha256'
  checksum64     = 'baf8ab4edff1604ba6cb81b5b98aa335'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
