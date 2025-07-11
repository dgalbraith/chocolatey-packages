﻿$ErrorActionPreference = 'Stop'

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  Write-Error -Message '32-bit version of naps2.portable not available' -Category ResourceUnavailable
}

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$archive  = Join-Path $toolsDir 'naps2-8.2.0-win-x64.zip'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

Remove-Item $toolsDir\*.zip -ea 0

Get-ChildItem $toolsDir -include *.exe -exclude 'NAPS2.exe','NAPS2.Console.exe' -recurse  | Select-Object { New-Item "$_.ignore" -type file -force } | Out-Null
