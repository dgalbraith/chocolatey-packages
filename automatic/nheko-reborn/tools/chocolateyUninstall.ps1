$ErrorActionPreference = 'Stop'

$packageName    = $env:ChocolateyPackageName
$packageSearch  = "Nheko*"
$installerType  = 'exe'
$silentArgs     = '--confirm-command purge'
$validExitCodes = @(0)

$uninstallKey    = Get-UninstallRegistryKey -SoftwareName $packageSearch

if ($null -ne $uninstallKey) {
  Uninstall-ChocolateyPackage -PackageName "$($packageName)" `
                              -FileType "$($installerType)" `
                              -SilentArgs "$($silentArgs)" `
                              -File "$($uninstallKey.UninstallString)" `
                              -ValidExitCodes $validExitCodes
}
