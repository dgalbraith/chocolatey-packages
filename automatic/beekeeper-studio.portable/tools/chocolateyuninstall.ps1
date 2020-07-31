$ErrorActionPreference = 'Stop';

$executable = Join-Path $installDir 'Beekeeper-Studio-1.6.11-portable.exe'

Uninstall-BinFile -Name 'BeekeeperStudio' -Path "$executable"
