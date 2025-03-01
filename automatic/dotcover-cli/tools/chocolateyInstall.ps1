$ErrorActionPreference = 'Stop'

$toolsDir  = Split-Path -parent $MyInvocation.MyCommand.Definition

$archive32 = Join-Path $toolsDir 'JetBrains.dotCover.CommandLineTools.windows-x86.2024.3.6.zip'
$archive64 = Join-Path $toolsDir 'JetBrains.dotCover.CommandLineTools.windows-x64.2024.3.6.zip'

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  $archive = $archive32
} else {
  $archive = $archive64
}

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

Remove-Item $toolsDir\*.zip -ea 0
Get-ChildItem $toolsDir -include *.exe -exclude 'dotCover.exe' -recurse  | Select-Object { New-Item "$_.ignore" -type file -force } | Out-Null
