$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$installer = Join-Path $toolsDir 'naps2-6.1.2-setup.msi'

$silentArgs = '/quiet /qn /norestart'

if ($pp.InstallDir) {
  $silentArgs += " INSTALLFOLDER=`"$($pp.InstallDir)`""
}

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileType       = 'msi'
  SoftwareName   = 'NAPS2'
  File           = $installer
  SilentArgs     = $silentArgs
  ValidExitCodes = @(0, 1641, 3010)
}

Install-ChocolateyPackage @packageArgs
