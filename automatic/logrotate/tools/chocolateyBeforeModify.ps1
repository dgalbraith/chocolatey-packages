$ErrorActionPreference = 'STOP'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageDir = "$($toolsDir | Split-Path -parent)"

Uninstall-BinFile -Name 'logrotate' -Path 'logrotate.exe'

$zipFileName = "$packageDir/logrotateSetup_0.0.0.17_20170116.zip"

$packageArgs = @{
  PackageName = $env:ChocolateyPackageName
  ZipFileName = $zipFileName
}

Uninstall-ChocolateyZipPackage @packageArgs

Remove-Item "$zipFileName.txt" -Force -ErrorAction SilentlyContinue | Out-Null
