$ErrorActionPreference = 'STOP'

. (Join-Path (Split-Path -parent $MyInvocation.MyCommand.Definition) 'Helpers.ps1')

$toolsDir   = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  File           = Join-Path $toolsDir 'logrotateSetup.exe'
  FileType       = 'exe'
  ValidExitCodes = @(0, 3010, 1641)
}

# the logrotate installer requires any previous version to be removed prior to a fresh installation
if (Test-LogRotateInstalled) {
  Stop-LogRotate

  $packageArgs.SilentArgs = '/S /x /v/qn'

  Uninstall-ChocolateyPackage @packageArgs
}

$archive = Join-Path $toolsDir 'logrotateSetup_0.0.0.17_20170116.zip'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

$packageArgs.SilentArgs = '/S /v/qn'

Install-ChocolateyInstallPackage @packageArgs

$installKey    = Get-InstallRegistryKey -SoftwareName 'LogRotate'
$installLocation = $installKey.InstallLocation

$executable = Get-ChildItem $installLocation -include logrotate.exe -recurse

Install-Binfile -Name 'logrotate' -Path $executable
