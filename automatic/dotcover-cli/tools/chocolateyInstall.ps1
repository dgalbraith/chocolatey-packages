$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$archive  = 'JetBrains.dotCover.CommandLineTools.2020.2.2.zip'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = Join-Path $toolsDir $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs
Remove-Item $toolsPath\*.zip -ea 0
Get-ChildItem $toolsDir -include *.exe -exclude 'dotCover.exe' -recurse  | Select-Object { New-Item "$_.ignore" -type file -force } | Out-Null
