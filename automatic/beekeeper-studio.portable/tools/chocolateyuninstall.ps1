$ErrorActionPreference = 'Stop';

$executable = Join-Path $installDir 'Beekeeper-Studio-1.7.4-portable.exe'

Uninstall-BinFile -Name 'BeekeeperStudio' -Path "$executable"
