$ErrorActionPreference = 'Stop';

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  $archive = Join-Path $toolsDir 'hakuneko-desktop_6.1.7_windows-portable_i386.zip'
}
else {
  $archive = Join-Path $toolsDir 'hakuneko-desktop_6.1.7_windows-portable_amd64.zip'
}

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileFullPath   = $archive
  Destination    = $toolsDir
}

Get-ChocolateyUnzip @packageArgs

$files = Get-ChildItem $toolsDir -include *.exe -recurse

foreach ($file in $files) {
  if ($file.Name -ne 'hakuneko.exe') {
    #generate an ignore file
    New-Item "$file.ignore" -type file -force | Out-Null
  }
}
