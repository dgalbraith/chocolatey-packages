$ErrorActionPreference = 'Stop'

$toolsDir     = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://www.elby.ch/download/SetupVirtualCloneDrive5530.exe'
  checksum       = 'c676e1cad4d505e3511715efc3be72617053dfb08812e24e0706238be6b8c627'
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
