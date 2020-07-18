$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$archive  = Join-Path $toolsDir 'mongodb-compass-1.21.1-win32-x64.zip' 

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

$files = Get-ChildItem $toolsDir -include *.exe -recurse

foreach ($file in $files) {
  if ($file.Name -ne 'MongoDBCompass.exe') {
    # generate an ignore file
    New-Item "$file.ignore" -type file -force | Out-Null
  }
}
