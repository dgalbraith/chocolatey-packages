$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = 'https://winaero.com/downloads/winaerotweaker.zip'
  checksum      = '175604C25B8650A83E0A0B42031172FC38E5C1BBDCE17D48CA0964EF2F2F6A7D'
  checksumType  = 'sha256'
  options = @{
    headers = @{
      referer = "https://winaero.com/download-winaero-tweaker"
    }
  }
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  file           = '{0}\WinaeroTweaker-{1}-setup.exe' -f $toolsDir, $env:packageVersion
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /PORTABLE  /DIR=`"$toolsDir`""
  validExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs
