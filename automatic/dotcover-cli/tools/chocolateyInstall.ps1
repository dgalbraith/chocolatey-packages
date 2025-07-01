$ErrorActionPreference = 'Stop'

$toolsDir  = Split-Path -parent $MyInvocation.MyCommand.Definition

$archive = Join-Path $toolsDir 'JetBrains.dotCover.CommandLineTools.2025.1.4.tar.gz'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
  Checksum     = 'A057125BFE0C94E9D0B59C89E8F6EB9BC73978781B1AD8F102C347C2BF4D7B2D'
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
