$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = 'https://winaero.com/downloads/winaerotweaker.zip'
  checksum      = 'C0EA2637BB7DAD6B5B2741DB706F56832EF4C4E40BFD3606B71386B0E8F10570'
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
  file           = '{0}\WinaeroTweaker-{1}-setup.exe' -f $toolsDir, $env:packageVersion
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs
