$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = 'https://winaerotweaker.com/download/winaerotweaker.zip'
  checksum      = 'c3e711fb6519f106409d368de9a37e7a0ce499fd609f0e938283fa32cd7fe212'
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
