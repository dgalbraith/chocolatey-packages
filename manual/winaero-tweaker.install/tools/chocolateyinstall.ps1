$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = 'https://winaero.com/downloads/winaerotweaker.zip'
  checksum      = 'F72DC5F81312D9AED5702752B2AC2C1A4594B74747FF093E9C6FF818C0A9C485'
  checksumType  = 'sha256'
  options = @{
    headers = @{
      referer = 'https://winaero.com/download-winaero-tweaker'
    }
  }
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  file           = '{0}\WinaeroTweaker-{1}-setup.exe' -f $toolsDir, ($env:packageVersion -split '(\.\d+)(?!.*\d)')[0]
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs
