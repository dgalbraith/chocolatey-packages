$ErrorActionPreference = 'Stop'

$toolsDir  = Split-Path -parent $MyInvocation.MyCommand.Definition

$archive = Join-Path $toolsDir 'JetBrains.dotCover.CommandLineTools.2025.1.5.tar.gz'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
  Checksum     = 'AF87631715D3605A2C4F64AB27628254D2B8B56BA24317E68451E4F9F57BDE32'
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
