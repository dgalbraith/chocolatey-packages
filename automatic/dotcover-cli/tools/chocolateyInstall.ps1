$ErrorActionPreference = 'Stop'

$toolsDir  = Split-Path -parent $MyInvocation.MyCommand.Definition

$archive = Join-Path $toolsDir 'JetBrains.dotCover.CommandLineTools.2025.1.1.tar.gz'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
  Checksum     = '2BF3D9898F2CC60B17EE370C3E8AFFE551704ACFA5DE9543A71B144787AD950A'
  ChecksumType = 'sha256'
}

Get-ChocolateyUnzip @unzipArgs

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive -replace '\.(zip|gz)$', ''
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

Remove-Item "$toolsDir\*.{zip,tar,gz}" -ea 0
Get-ChildItem $toolsDir -include *.exe -exclude 'dotCover.exe' -recurse  | Select-Object { New-Item "$_.ignore" -type file -force } | Out-Null
