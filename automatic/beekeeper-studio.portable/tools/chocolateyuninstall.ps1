$ErrorActionPreference = 'Stop';

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$executable = Join-Path $toolsDir 'Beekeeper-Studio-4.2.5-portable.exe'

Uninstall-BinFile -Name 'BeekeeperStudio' -Path "$executable"
