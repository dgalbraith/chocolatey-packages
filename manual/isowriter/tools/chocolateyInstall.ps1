$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://web.archive.org/web/20171001223928/http://isorecorder.alexfeinman.com/download/ISORecorder/ISOWriter.0.6.1.0.zip'
  checksum      = '1983E9144BFF25571B9D4897F82406AC68B2A016B3458D4D7210DE014F18DA2B'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
