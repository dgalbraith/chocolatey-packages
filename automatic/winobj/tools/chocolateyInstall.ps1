$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$regRoot = 'HKCU:\Software\Sysinternals'
$regPkg  = 'Winobj'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://download.sysinternals.com/files/WinObj.zip'
  checksum      = 'c5de57a34bf059aed5774bc6af4514c28dbb467d'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$regPath = Join-Path $regRoot $regPkg

if (!(Test-Path $regRoot)) {
  New-Item -Path "$regRoot"
}

if (!(Test-Path $regPath)) {
  New-Item -Path "$regRoot" -Name "$regPkg"
}

Set-ItemProperty -Path "$regPath" -Name EulaAccepted -Value 1

if ((Get-ItemProperty -Path "$regPath").EulaAccepted -ne 1) {
  throw "Failure updating registry to indicate EULA acceptance"
}
