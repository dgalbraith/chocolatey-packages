$ErrorActionPreference = 'Stop'

if ((Get-ProcessorBits 64) -and $env:ChocolateyForceX86 -eq 'true') {
  Write-Error -Message 'The x86 version of the Remote Desktop Cient cannot be installed on a 64-bit machine' -Category ResourceUnavailable
}

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$silentArgs = '/qn /norestart'
$packageSearch = 'Remote Desktop'

$pp = Get-PackageParameters

# install for all users (default), or the current user only if explicitly requested
if ($pp.User) {
  $silentArgs += ' ALLUSERS=2 MSIINSTALLPERUSER=1'
} else {
  $silentArgs += ' ALLUSERS=1'
}

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  SoftwareName   = $packageSearch
  FileType       = 'msi'
  Url            = 'https://res.cdn.office.net/remote-desktop-windows-client/5c02af6e-4ded-468f-8661-4efa6eb6c70e/RemoteDesktop_1.2.6599.0_x86.msi'
  Checksum       = 'a85186fd03324f457ceb9d45f30ae86833b63997f11727958bc8ff2b60b06d24'
  ChecksumType   = 'sha256'
  Url64          = 'https://res.cdn.office.net/remote-desktop-windows-client/3b32fc71-a065-450f-81ce-ac4c7a2db753/RemoteDesktop_1.2.6599.0_x64.msi'
  Checksum64     = 'c4410eb0142c162c58d23bdb2375d242076ef0cf9455056303385bda5cf7775b'
  ChecksumType64 = 'sha256'
  SilentArgs     = $silentArgs
  ValidExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

# update the registry to set the policy on automatic updates - unless explicitly specifed the Chocolatey
# package will override the standard behaviour and supress automatic updates ie. package management will
# be left to Chocoaltey
$registryPath = 'HKLM:\Software\Microsoft\MSRDC\Policies'
$name         = 'AutomaticUpdates'

if ($pp.AutoUpdate) {
  $value = '2'
} else {
  $value = '0'
}

if (-Not (Test-Path -Path $registryPath)) {
  New-Item -Path $registryPath -Force | Out-Null
}

Set-ItemProperty -Path $registryPath -Name $name -Value $value -Type DWORD -Force | Out-Null

$uninstallKey    = Get-UninstallRegistryKey -SoftwareName $packageArgs.SoftwareName
$installLocation = $uninstallKey.InstallLocation

Get-ChildItem $installLocation -recurse -include '*.exe' | foreach-object {
  Install-BinFile -Name ($_.Name -Replace '\..*') -Path $_.FullName
}

# add a shortcut to the start menu if required
if ($pp.AddToDesktop) {
  if ($pp.User) {
    $desktopPath = [Environment]::GetFolderPath('Desktop')
  } else {
    $desktopPath = [Environment]::GetFolderPath('CommonDesktopDirectory')
  }

  $executable = Join-Path $installLocation 'msrdcw.exe'
  $icon       = Join-Path $toolsDir 'msrdcw.ico'

  $shortcutPath = Join-Path $desktopPath 'Remote Desktop.lnk'
  Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $executable -WorkingDirectory '%userprofile%' -IconLocation $icon
}

# the start menu entry is added by default on install - remove if /NoStartMenu has been specifed
if ($pp.NoStartMenu) {
  if ($pp.User) {
    $startMenuPath = [Environment]::GetFolderPath('StartMenu')
  } else {
    $startMenuPath = [Environment]::GetFolderPath('CommonStartMenu')
  }

  $shortcutPath  = "$startMenuPath\Remote Desktop.lnk"

  if (Test-Path -Path $shortcutPath) {
    Remove-Item $shortcutPath -ErrorAction SilentlyContinue -Force | Out-Null
  }
}

