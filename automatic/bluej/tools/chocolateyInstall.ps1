$ErrorActionPreference = 'Stop';

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  Write-Error -Message "32-bit version of BlueJ not available" -Category ResourceUnavailable
}

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileType       = 'msi'
  Url64Bit       = 'https://github.com/k-pet-group/BlueJ-Greenfoot/releases/download/BLUEJ-RELEASE-5.4.2/BlueJ-windows-5.4.2.msi'
  Checksum64     = '85fb8f701f705acac1d0a1920c53e851cb6595ce83de9d5e86b02194a63bb163'
  ChecksumType64 = 'sha256'
  SilentArgs     = '/quiet /qn /norestart'
  ValidExitCodes = @(0,3010)
}

Install-ChocolateyPackage @packageArgs
