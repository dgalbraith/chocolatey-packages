$ErrorActionPreference = 'Stop'
$packageName = 'simple-sticky-notes'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file        = "$toolsDir\Setup_SimpleStickyNotes.exe"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  file           = $file
  validExitCodes = @(0,1)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  softwareName   = 'Simple Sticky Notes*'
  }
  
Install-ChocolateyInstallPackage @packageArgs
Remove-Item $toolsDir\*.exe -Force | Out-Null
Remove-Item $toolsDir\*.ignore -Force | Out-Null

# UPDATE INSTRUCTIONS:
# Replace .EXE file
