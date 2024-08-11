$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$silentArgs = '/quiet /qn /norestart'

if ($pp.InstallDir) {
  $silentArgs += " INSTALLFOLDER=`"$($pp.InstallDir)`""
}

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileType       = 'msi'
  SoftwareName   = 'NAPS2'
  File           = Join-Path $toolsDir 'naps2-7.5.0-win-x86.msi'
  File64         = Join-Path $toolsDir 'naps2-7.5.0-win-x64.msi'
  SilentArgs     = $silentArgs
  ValidExitCodes = @(0, 1641, 3010)
}

Install-ChocolateyPackage @packageArgs
