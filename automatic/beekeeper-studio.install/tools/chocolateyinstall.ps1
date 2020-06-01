$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  softwareName   = 'Beekeeper Studio*'
  file64         = "$toolsDir\Beekeeper-Studio-Setup-1.4.0.exe"
  checksum64     = '1CFB3E1B59D06AB8519F1D4699932DB43C06A9A5CBC76C8DD107F8F673B7C7F6'
  checksumType64 = 'sha256'
  silentArgs     = @('/S')
  validExitCodes = @(0, 1641, 3010)
}

Install-ChocolateyPackage @packageArgs

$files = Get-ChildItem $toolsDir -include *.exe -recurse

foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}
