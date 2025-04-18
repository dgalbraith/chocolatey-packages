$ErrorActionPreference = 'Stop'

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  Write-Error -Message '32-bit version of naps2.install not available' -Category ResourceUnavailable
}

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$silentArgs = '/quiet /qn /norestart'

if ($pp.InstallDir) {
  $silentArgs += " INSTALLFOLDER=`"$($pp.InstallDir)`""
}

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileType       = 'msi'
  SoftwareName   = 'NAPS2'
  File64         = Join-Path $toolsDir 'naps2-7.5.3-win-x64.msi'
  SilentArgs     = $silentArgs
  ValidExitCodes = @(0, 1641, 3010)
}

Install-ChocolateyPackage @packageArgs
