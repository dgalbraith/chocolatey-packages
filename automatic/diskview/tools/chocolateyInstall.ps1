$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$regRoot = 'HKCU:\Software\Sysinternals'
$regPkg  = 'DiskView'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://download.sysinternals.com/files/DiskView.zip'
  checksum      = '0ceac1623419ce74cfd079823130a76e23d1932ba6cc396157a299e9f23ebe2d'
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
