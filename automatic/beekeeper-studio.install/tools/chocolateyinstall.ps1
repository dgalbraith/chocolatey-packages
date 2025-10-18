$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  softwareName   = 'Beekeeper Studio*'
  file64         = "$toolsDir\Beekeeper-Studio-Setup-5.4.9.exe"
  checksumType64 = 'sha256'
  silentArgs     = @('/S')
  validExitCodes = @(0, 1641, 3010)
}

Install-ChocolateyPackage @packageArgs

$files = Get-ChildItem $toolsDir -include *.exe -recurse

foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}
