$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  file          = "$toolsDir\nheko-v0.10.1-installer.exe"
  silentArgs	= '--accept-licenses --confirm-command install'
}

Install-ChocolateyInstallPackage @packageArgs
