$ErrorActionPreference = 'Stop'

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  Write-Warning "Itefix no longer provide a 32-bit build of cwRsync"
  Write-Warning "32 bit users should specify version 5.5.0.20190204"
  Write-Error -Message "32-bit version of rsync not available" -Category ResourceUnavailable
}

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$archive  = Join-Path $toolsDir 'cwrsync_6.4.2_x64_free.zip'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

$files = Get-ChildItem $toolsDir -include *.exe -recurse

foreach ($file in $files) {
  if ($file.Name -ne 'rsync.exe') {
    New-Item "$file.ignore" -type file -force | Out-Null
  }
}
