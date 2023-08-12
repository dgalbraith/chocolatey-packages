$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = 'https://winaerotweaker.com/download/winaerotweaker.zip'
  checksum      = '370095778b69f763af03e553f5a83b192c7183d098cb0d87350f66fb525573b8'
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
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs
