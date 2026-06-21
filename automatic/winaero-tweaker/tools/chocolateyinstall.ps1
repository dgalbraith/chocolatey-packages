$ErrorActionPreference = 'Stop'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName  = 'winaero-tweaker.install'
$checksum_zip = '8349864814D217EC366DD2EFD8513F51CC5B3FEC84DDCCF6E1CAD0D9504A40AD'
$checksum_exe = '8E33F423C30D3977E48F4E57D5F05CF467FCD3468A093E0E8E5B2036F9439595'
$silentArgs   = @{$true=" /PORTABLE /DIR=`"$toolsDir`"";$false=""}[ ($packageName -match "portable")]

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'ZIP' 
  url           = 'https://winaero.com/e107_files/downloads/winaerotweaker.zip'
  checksum      = @{$true=$checksum_exe;$false=$checksum_zip}[ ($packageArgs.fileType -match "zip")]
  checksumType  = 'SHA256'
  Options = @{
    Headers = @{
      referer = "http://winaero.com/download.php?view.1796"
    }
  }  
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  file          = "$toolsDir\WinaeroTweaker-$env:packageVersion-setup.exe"
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-${silentArgs}"
  checksum      = @{$true=$checksum_exe;$false=$checksum_zip}[ ($packageArgs.fileType -match "zip")]
  checksumType  = 'SHA256'
  validExitCodes= @(0)
  softwareName  = 'Winaero Tweaker'
}

Install-ChocolateyInstallPackage @packageArgs						  
