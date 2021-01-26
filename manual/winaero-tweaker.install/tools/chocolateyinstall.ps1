$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = 'https://winaero.com/downloads/winaerotweaker.zip'
  checksum      = 'BE7EDE2B4C9853346B089B45041240B92FC5C22B647D1BF01D49137F174E16E5'
  checksumType  = 'sha256'
  options = @{
    headers = @{
      referer = "https://winaero.com/download-winaero-tweaker/"
    }
  }
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  softwareName  = 'Winaero Tweaker'
  file          = "$toolsDir\WinaeroTweaker-$env:packageVersion-setup.exe"
  checksum      = '4A5478DC18665C4AB7496467CDC3E549610EBBC8AD86BA1E7289E5EE2EC44B15'
  checksumType  = 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs
