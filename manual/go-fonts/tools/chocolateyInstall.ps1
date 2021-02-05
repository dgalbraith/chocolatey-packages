$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$archive  = Join-Path $toolsDir 'image-b7f8df6bc082334698d4505fb85fa05e99156b72-font-gofont-ttfs.tar.gz'

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
