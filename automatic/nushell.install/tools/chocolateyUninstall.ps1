$ErrorActionPreference = 'Stop'

$uninstallKey    = Get-UninstallRegistryKey -SoftwareName 'Nu'
$installLocation = $uninstallKey.InstallLocation

Get-ChildItem $installLocation -recurse -include '*.exe' | foreach-object {
  Uninstall-BinFile -Name $_.Name -Path $_.FullName
}
