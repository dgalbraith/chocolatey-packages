﻿$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$archive  = Join-Path $toolsDir 'naps2-8.1.3-win-x64.zip'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

Remove-Item $toolsDir\*.zip -ea 0

Get-ChildItem $toolsDir -include *.exe -exclude 'NAPS2.exe','NAPS2.Console.exe' -recurse  | Select-Object { New-Item "$_.ignore" -type file -force } | Out-Null
