$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = 'https://winaero.com/e107_files/downloads/winaerotweaker.zip'
  checksum      = 'D7B8F6D97BCBA6587AEA7B5E37A9569F1B29A47EBE6BE8665CF639D45950C93A'
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
  checksum      = 'F1EA7EFA6971CB22AE58572BD7B8767AD2260923EF57E2B3450A80F94C77406C'
  checksumType  = 'sha256'
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /PORTABLE  /DIR=`"$toolsDir`""
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs
