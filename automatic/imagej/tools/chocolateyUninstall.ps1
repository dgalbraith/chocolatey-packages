$ErrorActionPreference = 'Stop'

Uninstall-Binfile -name 'imagej' -path 'imagej.exe'

Uninstall-ChocolateyZipPackage 'imagej' 'ij152-win-java8.zip'
