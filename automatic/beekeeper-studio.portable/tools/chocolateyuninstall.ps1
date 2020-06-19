$ErrorActionPreference = 'Stop';

$executable = Join-Path $installDir 'Beekeeper-Studio-1.5.3-portable.exe'

Uninstall-BinFile -Name 'BeekeeperStudio' -Path "$executable"
