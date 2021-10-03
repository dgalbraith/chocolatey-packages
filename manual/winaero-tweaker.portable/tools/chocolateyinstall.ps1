$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = 'https://winaero.com/downloads/winaerotweaker.zip'
  checksum      = 'AFF82AE47D93DA0CA329D560A2B76FDBC47077B5DCA5B1BC840979AFBA5EE270'
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
