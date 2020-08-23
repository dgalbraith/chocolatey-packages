$ErrorActionPreference = 'Stop';

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$installer = Join-Path $toolsDir 'ipnetinfo_setup.exe'

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  File           = $installer
  FileType       = 'exe'
  SilentArgs     = '/S'
  ValidExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs

$files = Get-ChildItem $toolsDir -include *.exe -recurse

foreach ($file in $files) {
  #generate an ignore file
  New-Item "$file.ignore" -type file -force | Out-Null
}
