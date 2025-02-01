$ErrorActionPreference = 'Stop'

Get-ChildItem $installLocation -recurse -include '*.exe' | foreach-object {
    Uninstall-BinFile -Name ($_.Name -Replace '\..*') -Path $_.FullName
  }

Uninstall-ChocolateyZipPackage $env:ChocolateyPackageName 'mame0274b_64bit.exe'
