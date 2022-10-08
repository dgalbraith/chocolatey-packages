$ErrorActionPreference = 'STOP'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$archive = Join-Path $toolsDir 'logrotateSetup_0.0.0.17_20170116.zip'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

$installer = Join-Path $toolsDir 'logrotateSetup.exe'

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  File           = $installer
  FileType       = 'exe'
  SilentArgs     = '/S /v/qn'
  ValidExitCodes = @(0, 3010, 1641)
}


Install-ChocolateyInstallPackage @packageArgs

Remove-Item $installer -ErrorAction SilentlyContinue -Force | Out-Null

$uninstallKey    = Get-UninstallRegistryKey -SoftwareName 'LogRotate'
$installLocation = $uninstallKey.InstallLocation

$executable = Get-ChildItem $installLocation -include logrotate.exe -recurse

Install-Binfile -Name 'logrotate' -Path $executable

