$ErrorActionPreference = 'Stop'

Uninstall-BinFile -Name 'Angband' -Path 'Angband.exe'

Uninstall-ChocolateyZipPackage 'Angband-4.2.4-win.zip'
