$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  $archive = Join-Path $toolsDir 'Sourcetrail_2019_4_61_Windows_32bit_Portable.zip'
  $folder = 'Sourcetrail_2019_4_61_32bit_Portable\Sourcetrail_2019_4_61_32bit'
  $target = Join-Path (Get-ToolsLocation) 'Sourcetrail_Portable_32bit'
}
else {
  $archive = Join-Path $toolsDir 'Sourcetrail_2019_4_61_Windows_64bit_Portable.zip'
  $folder = 'Sourcetrail_2019_4_61_64bit_Portable\Sourcetrail_2019_4_61_64bit'
  $target = Join-Path (Get-ToolsLocation) 'Sourcetrail_Portable_64bit'
}

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileFullPath   = $archive
  Destination    = $target
  SpecificFolder = $folder
}

Get-ChocolateyUnzip @packageArgs

# move the extracted files into a path that will be consistent across versions
$source = Join-Path $target $folder | Join-Path -ChildPath '*'
Copy-Item -Path $source -Destination $target -Recurse -Container -Force
Remove-Item -Path (Join-Path $target $folder.Split('\')[0]) -Recurse -ea 0

# clean any extracted zips - they are recoverable from the nupkg
Remove-Item $toolsDir\*.zip -ea 0

# mark the main executable as a gui for shim generation
New-Item (Join-Path $target 'Sourcetrail.exe.gui') -Type file -Force | Out-Null
