$ErrorActionPreference = 'Stop'

$localisedName = $installLocation = (Get-WmiObject -Class Win32_Product -Filter 'IdentifyingNumber like "{37482C7A-E958-455E-938E-0692B5C28708}" OR IdentifyingNumber like "{74E5B442-57F5-4097-95EA-38E8DBA1EBF1}"').Name
$silentArgs     = '/qn /norestart'
$validExitCodes = @(0, 1614, 1641, 3010)

$uninstallKey = Get-UninstallRegistryKey -SoftwareName $localisedName

if ($null -ne $uninstallKey) {
  $installLocation = $uninstallKey.InstallLocation

  Get-ChildItem $installLocation -recurse -include '*.exe' | foreach-object {
    Uninstall-BinFile -Name ($_.Name -Replace '\..*') -Path $_.FullName
  }

  # extract the product key {6CE4170F-A4CD-47A0-ABFD-61C59E5F4B43} from the uninstall string and prepend
  # to the existing $silentArgs.  The uninstall string includes the fully qualified uninstall command
  # msiexec /X{6CE4170F-A4CD-47A0-ABFD-61C59E5F4B43} which needs to be removed so that the Chocolatey
  # helper function can be invoked.  The alternate approach would have been to specify a FileType of
  # 'exe' and execute the uninstall with File = "$($env:SystemRoot)\System32\msiexec.exe"
  $silentArgs = '{0} {1}' -f ($uninstallKey.UninstallString -split '/X' | Select-Object -Last 1), $silentArgs

  $packageArgs = @{
    PackageName    = $env:ChocolateyPackageName
    FileType       = 'msi'
    SilentArgs     = $silentArgs
    ValidExitCodes = $validExitCodes
  }

  Uninstall-ChocolateyPackage @packageArgs
}
