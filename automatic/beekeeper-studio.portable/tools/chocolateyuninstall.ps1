$ErrorActionPreference = 'Stop';

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$executable = Join-Path $toolsDir 'Beekeeper-Studio-4.6.8-portable.exe'

Uninstall-BinFile -Name 'BeekeeperStudio' -Path "$executable"
