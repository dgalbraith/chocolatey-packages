$ErrorActionPreference = 'Stop';

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  throw '32-bit install not supported'
} else {
  $archive = Join-Path $toolsDir 'sd.0.7.5-.x86_64-pc-windows-msvc.zip'
}

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

$files = Get-ChildItem $toolsDir -include *.exe -recurse

foreach ($file in $files) {
  if ($file.Name -ne 'sd.exe') {
    #generate an ignore file
    New-Item "$file.ignore" -type file -force | Out-Null
  }
}
