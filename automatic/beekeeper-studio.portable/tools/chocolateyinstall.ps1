$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$files = Get-ChildItem $toolsDir -include *.exe -recurse

foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

$executable = Join-Path $toolsDir 'Beekeeper-Studio-1.7.5-portable.exe'

Install-BinFile -UseStart -Name 'BeekeeperStudio' -Path "$executable"
