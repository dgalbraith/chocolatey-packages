$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$files = Get-ChildItem $toolsDir -include *.ttf -recurse

foreach ($file in $files) {
  Uninstall-ChocolateyFont $file.Name | Out-Null
}
