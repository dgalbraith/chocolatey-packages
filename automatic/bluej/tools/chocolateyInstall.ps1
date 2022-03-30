$ErrorActionPreference = 'Stop';

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  Write-Error -Message "32-bit version of BlueJ not available" -Category ResourceUnavailable
}

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileType       = 'msi'
  Url64Bit       = 'https://www.bluej.org/download/files/BlueJ-windows-503.msi'
  Checksum64     = '38b90aff427e4f6e6f49c8b1aac2e255c980762fd6a56061fc9866afe3210987'
  ChecksumType64 = 'sha256'
  SilentArgs     = '/quiet /qn /norestart'
  ValidExitCodes = @(0,3010)
}

Install-ChocolateyPackage @packageArgs
