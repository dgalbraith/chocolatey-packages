﻿$ErrorActionPreference = 'Stop';

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$archive = Join-Path $toolsDir 'fbcacheview.zip'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs
