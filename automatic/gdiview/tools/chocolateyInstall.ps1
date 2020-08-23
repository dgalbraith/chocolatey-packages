$ErrorActionPreference = 'Stop';

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

if ((Get-ProcessorBits 32) -eq 'true') {
  $archive = Join-Path $toolsDir 'gdiview.zip'
}
else {
  # fail if a 32-bit install is forced in a 64-bit environment
  if ($env:ChocolateyForceX86 -eq 'true') {
      Write-Error('32-bit install not supported in a 64-bit environment')
  } else {
    $archive = Join-Path $toolsDir 'gdiview-x64.zip'
  }
}

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs
