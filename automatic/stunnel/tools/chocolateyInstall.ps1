$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  File           = "$toolsDir\stunnel-5.62-win64-installer.exe"
  SilentArgs     = '/S'
  ValidExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs
