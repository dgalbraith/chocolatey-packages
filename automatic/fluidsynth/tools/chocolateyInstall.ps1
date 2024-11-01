$ErrorActionPreference = 'Stop'

$toolsDir  = (Split-Path -parent $MyInvocation.MyCommand.Definition)

if ((Get-ProcessorBits 32) -eq 'true' -or $env:ChocolateyForceX86 -eq 'true') {
  $archive = Join-Path $toolsDir 'fluidsynth-2.4.0-winXP-x86.zip'
}
else {
  $archive = Join-Path $toolsDir 'fluidsynth-2.4.0-win10-x64.zip'
}

$installDir = Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $installDir
}

Get-ChocolateyUnzip @unzipArgs

$executable = Get-ChildItem $installDir -include fluidsynth.exe -recurse

Install-Binfile -Name 'fluidsynth' -Path $executable
