$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$archive  = Join-Path $toolsDir 'sqlean-win-x64.zip'

$pp = Get-PackageParameters

if ($pp.InstallDir) {
  Write-Verbose("$env:ChocolateyPackageName will be installed to $pp.InstallDir")
  $installDir = $pp.InstallDir
} else {
  $installDir = Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName
}

$unzipArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileFullPath64 = $archive
  Destination    = $installDir
}

Get-ChocolateyUnzip @unzipArgs
