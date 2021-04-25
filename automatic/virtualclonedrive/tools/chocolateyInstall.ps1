$ErrorActionPreference = 'Stop'

$toolsDir     = Split-Path -parent $MyInvocation.MyCommand.Definition
$certificate  = Join-Path $toolsDir 'ElaborateBytesAG.p7b'

# serial numbers for the certificates contained in the ElaborateBytesAG.p7b file
$certificates = @{ 
  '0400000000012F4EE1355C' = $null # Elaborate Bytes AG
  '040000000001154B5AC394' = $null # GlobalSign Code SIgning CA - G2
  '11219EC29016D73F2CC88EB9CC8B4F8E78FB' = $null # GlobalSign Root CA
}

$existingCertificates = @{}

# determine if any of the certificates that we will install are already present
Get-ChildItem -Path Cert:\LocalMachine\TrustedPublisher -Recurse `
    | where-object { $certificates.containsKey($_.SerialNumber) } `
    | foreach-object { $existingCertificates.Add($_.SerialNumber, $_) }

# register the certificate used to sign the driver in the Trusted Publisher store
certutil -addstore 'TrustedPublisher' $certificate

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

# remove any certificates which were added once the package/driver has been installed
Get-ChildItem -Path Cert:\LocalMachine\TrustedPublisher -Recurse `
    | where-object { $certificates.containsKey($_.SerialNumber) } `
    | foreach-object { if (-Not $existingCertificates.ContainsKey($_.SerialNumber)) { certutil -delstore 'TrustedPublisher' $_.SerialNumber } }
