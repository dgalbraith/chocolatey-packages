$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  softwareName  = 'Clipto Pro*'
  file          = "$toolsDir\clipto.pro-1.8.6.exe"
  checksum      = '969591FBABC3226EF399C60ED555F09AEAE9DAEC943DEB3CACF3CD444B224920'
  checksumType  = 'sha256'
  #installer supports global and current user install but setting to allusers in keeping with
  #the Chocolatey philosophy setting to a global install
  silentArgs    = @('/S'; 'allusers')
  validExitCodes= @(0, 1641, 3010)
}

Install-ChocolateyPackage @packageArgs
