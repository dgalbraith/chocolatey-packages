$ErrorActionPreference = 'Stop';

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  Write-Error -Message "32-bit version of BlueJ not available" -Category ResourceUnavailable
}

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileType       = 'msi'
  Url64Bit       = 'https://github.com/k-pet-group/BlueJ-Greenfoot/releases/download/BLUEJ-RELEASE-6.0.1/BlueJ-windows-6.0.1.msi'
  Checksum64     = '7fe55fd4e5de9e57c417891c813fb4ee28c62b5bf112435f9ba43a5cf8b5e315'
  ChecksumType64 = 'sha256'
  SilentArgs     = '/quiet /qn /norestart'
  ValidExitCodes = @(0,3010)
}

Install-ChocolateyPackage @packageArgs
