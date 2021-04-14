$ErrorActionPreference = 'Stop'

$toolsDir   = Split-Path -parent $MyInvocation.MyCommand.Definition
$executable = Get-ChildItem -Path $toolsDir 'sqlite?_analyzer.exe' -Recurse

Uninstall-BinFile -Name $executable.Name -Path $executable
