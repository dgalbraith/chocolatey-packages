$ErrorActionPreference = 'Stop';

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  $installer = Join-Path $toolsDir 'hakuneko-desktop_6.1.7_windows-setup_i386.exe'
}
else {
  $installer = Join-Path $toolsDir 'hakuneko-desktop_6.1.7_windows-setup_amd64.exe'
}

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  SoftwareName   = 'HakuNeko*'
  File           = $installer
  FileType       = 'exe'
  SilentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  ValidExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs

$files = Get-ChildItem $toolsDir -include *.exe -recurse

foreach ($file in $files) {
  #generate an ignore file
  New-Item "$file.ignore" -type file -force | Out-Null
}

