$ErrorActionPreference = 'Stop';

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  Write-Error -Message "32-bit version of BlueJ not available" -Category ResourceUnavailable
}

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileType       = 'msi'
  Url64Bit       = 'https://github.com/k-pet-group/BlueJ-Greenfoot/releases/download/BLUEJ-RELEASE-6.0.0/BlueJ-windows-6.0.0.msi'
  Checksum64     = '4383dae085447d55672f9521320bd60f23fd3cf7d88e219c17a4731dad665528'
  ChecksumType64 = 'sha256'
  SilentArgs     = '/quiet /qn /norestart'
  ValidExitCodes = @(0,3010)
}

Install-ChocolateyPackage @packageArgs
