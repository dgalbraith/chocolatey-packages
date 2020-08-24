$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  File           = "$toolsDir\PictInst.exe"
  SilentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  ValidExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs
