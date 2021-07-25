$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  softwareName   = 'Apache Directory Studio*'
  file64         = "$toolsDir\ApacheDirectoryStudio-2.0.0.v20210717-M17-win32.win32.x86_64.exe"
  checksumType64 = 'sha512'
  silentArgs     = @('/S')
  validExitCodes = @(0, 1641, 3010)
}

Install-ChocolateyPackage @packageArgs
