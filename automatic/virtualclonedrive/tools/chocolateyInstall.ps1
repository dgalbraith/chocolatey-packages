$ErrorActionPreference = 'Stop'

$toolsDir     = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://www.elby.ch/download/SetupVCD5520.exe'
  checksum       = 'b69ab416fa1c2db43d9d4a900abbf5e1ad6daf0ab914afcdfa74b25af390747f'
  checksumType   = 'sha256'
  silentArgs     = '/S /noreboot'
  validExitCodes = @(0)
}

# installs on Windows versions prior to Windows 10/Windows Server 2016 display dialogs even
# with the silent installation options passed
if ([Environment]::OSVersion.Version.Major -lt 10) {
  Start-Process 'AutoHotKey' "$toolsDir\chocolateyInstall.ahk"
}

Install-ChocolateyPackage @packageArgs

$pp = Get-PackageParameters

# a desktop shortcut is added by default so remove it if not required
if (-not $pp.AddToDesktop) {
  $desktopPath = [System.Environment]::GetFolderPath('CommonDesktopDirectory')
  Remove-Item "$desktopPath\Virtual CloneDrive.lnk" -ErrorAction SilentlyContinue -Force
}
