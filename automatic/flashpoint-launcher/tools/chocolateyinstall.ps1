$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  $archive = Join-Path $toolsDir 'Flashpoint-9.1.0_win-ia32.7z'
} else {
  $archive = Join-Path $toolsDir 'Flashpoint-9.1.0_win-x64.7z'
}

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

$files = Get-ChildItem $toolsDir -include '*.7z'

foreach ($file in $files) {
  Remove-Item $file -Type file -Force -ErrorAction Ignore | Out-Null
}

