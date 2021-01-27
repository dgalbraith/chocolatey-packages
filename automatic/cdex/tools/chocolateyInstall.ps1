$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  file           = "$toolsDir\CDex-2.24.exe"
  checksumType   = 'sha256'
  silentArgs     = @('/S')
  validExitCodes = @(0)
}

Start-Process 'AutoHotKey' "$toolsDir\chocolateyInstall.ahk"

Install-ChocolateyInstallPackage @packageArgs
