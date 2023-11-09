$ErrorActionPreference = 'Stop'

Uninstall-Binfile -name 'imagej' -path 'imagej.exe'

Uninstall-ChocolateyZipPackage 'imagej' 'ij154-win-java8.zip'
