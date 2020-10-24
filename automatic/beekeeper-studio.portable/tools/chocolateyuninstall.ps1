$ErrorActionPreference = 'Stop';

$executable = Join-Path $installDir 'Beekeeper-Studio-1.8.5-portable.exe'

Uninstall-BinFile -Name 'BeekeeperStudio' -Path "$executable"
