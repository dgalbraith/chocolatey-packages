$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = 'https://winaero.com/downloads/winaerotweaker.zip'
  checksum      = '2AFB617F444D801CD39C5C94DF3E6DFED265752160C3963082B7B34C5A48449E'
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
  checksum      = '820217E028C858D059D9BE4DCD75EC790B36C68FEF2F33346AC9D0B26815076C'
  checksumType  = 'sha256'
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /PORTABLE  /DIR=`"$toolsDir`""
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs
