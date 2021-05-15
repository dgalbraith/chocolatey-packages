$ErrorActionPreference = 'Stop'

Uninstall-BinFile -Name 'Angband' -Path 'Angband.exe'

Uninstall-ChocolateyZipPackage 'Angband' 'angband-win-4.2.2.zip'
