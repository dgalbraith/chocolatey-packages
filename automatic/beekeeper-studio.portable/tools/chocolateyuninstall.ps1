﻿$ErrorActionPreference = 'Stop';

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$executable = Join-Path $toolsDir 'Beekeeper-Studio-5.2.9-portable.exe'

Uninstall-BinFile -Name 'BeekeeperStudio' -Path "$executable"
