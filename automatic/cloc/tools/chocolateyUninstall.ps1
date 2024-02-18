$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$binArgs = @{
  name = $env:ChocolateyPackageName
  path = "$toolsDir\cloc-2.00.exe"
}

Remove-BinFile @binArgs
