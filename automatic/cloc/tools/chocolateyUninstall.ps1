$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$binArgs = @{
  name = $env:ChocolateyPackageName
  path = "$toolsDir\cloc-1.98.exe"
}

Remove-BinFile @binArgs
