$ErrorActionPreference = 'Stop';

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  $archive = Join-Path $toolsDir 'Sourcetrail_2019_4_61_Windows_32bit_Installer.zip'
  $extract = Join-Path $toolsDir 'Sourcetrail_2019_4_61_32bit_Installer'
}
else {
  $archive = Join-Path $toolsDir 'Sourcetrail_2019_4_61_Windows_64bit_Installer.zip'
  $extract = Join-Path $toolsDir 'Sourcetrail_2019_4_61_64bit_Installer'
}

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs
Remove-Item $toolsDir\*.zip -ea 0

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  SoftwareName   = 'Sourcetrail*'
  File           = Join-Path $extract 'sourcetrail.msi'
  FileType       = 'msi'
  SilentArgs     = '/quiet /norestart'
  ValidExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs
Remove-Item -Path $extract -Recurse -Force -ea 0
