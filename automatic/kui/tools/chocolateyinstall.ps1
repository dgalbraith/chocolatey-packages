$ErrorActionPreference = 'Stop'

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  Write-Error -Message '32-bit version of kui not available' -Category ResourceUnavailable
}

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = "$toolsDir\Kui-win32-x64.zip"
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

$files = Get-ChildItem $toolsDir -include *.exe -recurse

foreach ($file in $files) {
  if ($file.Name -ne 'Kui.exe') {
    #generate an ignore file
    New-Item "$file.ignore" -type file -force | Out-Null
  }
}
