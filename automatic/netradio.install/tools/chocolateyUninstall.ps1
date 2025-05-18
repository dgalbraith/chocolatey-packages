$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Uninstall-Binfile -name 'NetRadio' -path 'NetRadio.exe'

$uninstallKey = Get-UninstallRegistryKey -SoftwareName 'NetRadio*'

$silentArgs = '{0} {1}' -f ($uninstallKey.QuietUninstallString -split ' ' | Select-Object -Last 1), $silentArgs

  $packageArgs = @{
    PackageName    = $env:ChocolateyPackageName
    File           = $uninstallKey.UninstallString
    FileType       = 'exe'
    SilentArgs     = $silentArgs
    ValidExitCodes = @(0)
  }

Start-Process 'AutoHotKey' "$toolsDir\chocolateyUninstall.ahk"

Uninstall-ChocolateyPackage @packageArgs
