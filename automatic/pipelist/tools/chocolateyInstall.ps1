﻿$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$regRoot = 'HKCU:\Software\Sysinternals'
$regPkg  = 'PipeList'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://download.sysinternals.com/files/PipeList.zip'
  checksum      = '7bfef3046bfcce3efa666c4ae235b3a903ddc8ddba830a5c3ee4178e0a712b8d'
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
