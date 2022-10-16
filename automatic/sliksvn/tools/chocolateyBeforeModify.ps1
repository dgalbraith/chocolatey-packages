$ErrorActionPreference = 'Stop'

$uninstallKey    = Get-UninstallRegistryKey -SoftwareName 'Slik Subversion*'
$installLocation = $uninstallKey.InstallLocation

Get-ChildItem $installLocation -recurse -include '*.exe' | foreach-object {
  Uninstall-BinFile -Name ($_.Name -Replace '\..*') -Path $_.FullName
}
