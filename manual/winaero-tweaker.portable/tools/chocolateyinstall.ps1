$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = 'https://winaero.com/e107_files/downloads/winaerotweaker.zip'
  checksum      = '8349864814D217EC366DD2EFD8513F51CC5B3FEC84DDCCF6E1CAD0D9504A40AD'
  checksumType  = 'sha256'
  options = @{
    headers = @{
      referer = "https://winaero.com/download.php?view.1796"
    }
  }
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  softwareName  = 'Winaero Tweaker'
  file          = "$toolsDir\WinaeroTweaker-$env:packageVersion-setup.exe"
  checksum      = '8E33F423C30D3977E48F4E57D5F05CF467FCD3468A093E0E8E5B2036F9439595'
  checksumType  = 'sha256'
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /PORTABLE  /DIR=`"$toolsDir`""
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs
