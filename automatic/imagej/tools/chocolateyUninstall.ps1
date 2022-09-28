$ErrorActionPreference = 'Stop'

Uninstall-Binfile -name 'imagej' -path 'imagej.exe'

Uninstall-ChocolateyZipPackage 'imagej' 'ij153-win-java8.zip'
