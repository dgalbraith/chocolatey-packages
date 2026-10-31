$ErrorActionPreference = 'Stop'

$toolsDir  = Split-Path -parent $MyInvocation.MyCommand.Definition

$archive = Join-Path $toolsDir 'JetBrains.dotCover.CommandLineTools.2026.2.4.tar.gz'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
  Checksum     = '376FB3BCA26CA45E429520498A80ADAB8B821B371B8FA4C41693B0DCC0F5143A'
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
