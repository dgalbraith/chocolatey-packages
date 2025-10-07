$ErrorActionPreference = 'Stop'

$toolsDir  = Split-Path -parent $MyInvocation.MyCommand.Definition

$archive = Join-Path $toolsDir 'JetBrains.dotCover.CommandLineTools.2025.2.3.tar.gz'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
  Checksum     = '0EAB9BF9E63B42E09D67FCC105618BF5781317AE4892D3D5F9E3DD989906C56F'
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
