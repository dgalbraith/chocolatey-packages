$ErrorActionPreference = 'Stop';

$executable = Join-Path $installDir 'Beekeeper-Studio-1.4.1-portable.exe'

Uninstall-BinFile -Name 'BeekeeperStudio' -Path "$executable"
