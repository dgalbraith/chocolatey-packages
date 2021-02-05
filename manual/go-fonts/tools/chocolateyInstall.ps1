$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$archive  = Join-Path $toolsDir 'image-f03a046406d4d7fbfd4ed29f554da8f6114049fc-font-gofont-ttfs.tar.gz'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

$unzipArgs = @{
  FileFullPath = $archive -match '(?<tar>(.+))(\.gz)$' | foreach-object { $Matches.tar }
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs
Remove-item $unzipArgs.FileFullPath -Force -ErrorAction ignore

Install-ChocolateyFont $toolsDir -multiple | Out-Null
