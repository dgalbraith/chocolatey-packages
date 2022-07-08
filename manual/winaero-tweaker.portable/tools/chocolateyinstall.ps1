$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = 'https://winaerotweaker.com/download/winaerotweaker.zip'
  checksum      = '137A628D2CA222BA42FCFB3696FEFE93012A13ECCD4F4408E7FFDAC33CD7D56F'
  checksumType  = 'sha256'
  options = @{
    headers = @{
      referer = 'https://winaerotweaker.com/'
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
