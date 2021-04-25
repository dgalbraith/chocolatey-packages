$ErrorActionPreference = 'Stop'

$toolsDir     = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://www.elby.ch/download/SetupVCD5520.exe'
  checksum       = 'B69AB416FA1C2DB43D9D4A900ABBF5E1AD6DAF0AB914AFCDFA74B25AF390747F'
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
