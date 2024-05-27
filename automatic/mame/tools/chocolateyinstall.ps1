$ErrorActionPreference = 'Stop'
$packageName    = 'mame' 
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$TodaysVersion  = ($env:ChocolateyPackageVersion -replace '[.]','')

$packageArgs = @{
  packageName    = $packageName
  Destination    = $toolsDir
  FileFullPath64 = "$toolsDir\mame" + $TodaysVersion + "b_64bit.exe"
}

Get-ChocolateyUnzip @packageArgs

Install-ChocolateyShortcut -shortcutFilePath "$env:Public\Desktop\MAME.lnk" -targetPath "$toolsDir\mame.exe" -WorkingDirectory "$toolsDir"
Install-ChocolateyShortcut -shortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\MAME.lnk" -targetPath "$toolsDir\mame.exe" -WorkingDirectory "$toolsDir"

Remove-Item $toolsDir\mame*_64bit.exe | Out-Null

$WhoAmI=whoami
icacls.exe $toolsDir /grant $WhoAmI":"'(OI)(CI)'F /T | Out-Null

Get-ChildItem -Path $toolsDir -Recurse | Where {
 $_.Extension -eq '.exe'} | % {
 New-Item $($_.FullName + '.ignore') -Force -ItemType file
} | Out-Null
