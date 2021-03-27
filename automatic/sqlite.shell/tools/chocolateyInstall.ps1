$ErrorActionPreference = 'Stop'

$toolsDir   = Split-Path -parent $MyInvocation.MyCommand.Definition
$executable = Get-ChildItem -Path $toolsDir 'sqlite?.exe' -Recurse

Install-BinFile -Name $executable.Name -Path $executable
