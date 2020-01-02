$ErrorActionPreference = 'Stop'

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  $folder = 'Sourcetrail_Portable_32bit'
}
else {
  $folder = 'Sourcetrail_Portable_64bit'
}

$target = Join-Path (Get-ToolsLocation) $folder
Remove-Item -Path $target -Recurse -ea 0
