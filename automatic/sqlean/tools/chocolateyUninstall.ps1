$ErrorActionPreference = 'Stop'

Uninstall-ChocolateyZipPackage "$env:ChocolateyPackageName" 'sqlean-win-x64.zip'
