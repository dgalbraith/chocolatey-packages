$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip' 
  url           = 'https://winaero.com/e107_files/downloads/winaerotweaker.zip'
  checksum      = 'F0D010B7EFDDFC8DC558A556324EF3B3B523B4C6A4BD3C779CB0371B036D3550'
  checksumType  = 'sha256'
  options = @{
    headers = @{
      referer = "http://winaero.com/download.php?view.1796"
    }
  }  
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  softwareName  = 'Winaero Tweaker'
  file          = "$toolsDir\WinaeroTweaker-$env:packageVersion-setup.exe"
  checksum      = 'C7B77C477A3790032040A50C35C935C1D94A3E11DA12BD9F7970D3C62A08E69A'
  checksumType  = 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs						  
