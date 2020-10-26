$ErrorActionPreference = 'Stop';

$executable = Join-Path $installDir 'Beekeeper-Studio-1.8.7-portable.exe'

Uninstall-BinFile -Name 'BeekeeperStudio' -Path "$executable"
