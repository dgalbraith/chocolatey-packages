$ErrorActionPreference = 'Stop';

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  Write-Error -Message "32-bit version of BlueJ not available" -Category ResourceUnavailable
}

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileType       = 'msi'
  Url64Bit       = 'https://github.com/k-pet-group/BlueJ-Greenfoot/releases/download/BLUEJ-RELEASE-5.5.0/BlueJ-windows-5.5.0.msi'
  Checksum64     = '697404b7f704235878861bd4133e24480e17e74942f0a9d31db08ddfe4ee21c0'
  ChecksumType64 = 'sha256'
  SilentArgs     = '/quiet /qn /norestart'
  ValidExitCodes = @(0,3010)
}

Install-ChocolateyPackage @packageArgs
