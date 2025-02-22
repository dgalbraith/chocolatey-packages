$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = 'https://winaerotweaker.com/download/winaerotweaker.zip'
  checksum      = '8b46861abb7266c798b27cd6e4cc95e6e81215870128f892236b7a27dfb02b74'
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
  file           = '{0}\WinaeroTweaker-{1}.0-setup.exe' -f $toolsDir, $env:packageVersion
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /PORTABLE  /DIR=`"$toolsDir`""
  validExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs
