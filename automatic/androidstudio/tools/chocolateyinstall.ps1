$ErrorActionPreference = 'Stop';

$url        = 'https://edgedl.me.gvt1.com/android/studio/install/2026.2.2.9/android-studio-rabbit2-patch1-windows.exe'
$checksum   = '00e98c1c23e1d27a8079951291d1ae310bbc8c7ef1030ab9db1f45a1bb96543b'
$silentArgs = '/S'

# the installer includes both 32 and 64-bit executables so set the correct executable
# to be used based on the OS bitness
if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  $executable = 'studio.exe'
} else {
  $executable = 'studio64.exe'
}

$pp = Get-PackageParameters

$addToDesktop = $false
$noStartMenu  = $false
$pinToTaskBar = $false

if ($pp.count -gt 0) {
  $pp.GetEnumerator() | foreach-object {
  switch ($_.name) {
      'AddToDesktop' {
        $addToDesktop = $true
      }
      'NoStartMenu' {
        $noStartMenu = $true
      }
      'PinToTaskBar' {
        $pinToTaskBar = $true
      }
      Default {
        Write-Verbose("Unknown parameter $_ will be ignored")
      }
    }
  }
}

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileType       = 'exe'
  SoftwareName   = 'Android Studio'
  Url            = $url
  Checksum       = $checksum
  ChecksumType   = 'sha256'
  Url64bit       = $url
  Checksum64     = $checksum
  ChecksumType64 = 'sha256'
  SilentArgs     = $silentArgs
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs

$uninstallKey    = Get-UninstallRegistryKey -SoftwareName 'Android Studio'
$installLocation = Split-Path -Parent $uninstallKey.UninstallString
$executable      = Get-ChildItem $installLocation -include $executable -recurse

Install-Binfile -name ($executable.Name -Split '\.' | Select-Object -First 1) -Path $executable.FullName

if ($addToDesktop) {
  $desktopPath = [Environment]::GetFolderPath('CommonDesktopDirectory')

  $shortcutPath = "$desktopPath\Android Studio.lnk"

  if (Test-Path -Path $shortcutPath) {
    Remove-Item $shortcutPath -ErrorAction SilentlyContinue -Force | Out-Null
  }

  Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $executable
}

# the start menu entry for Android Studio is added by default on install - remove if /NoStartMenu has been specifed
if ($noStartMenu) {
  $startMenuPath = [Environment]::GetFolderPath('CommonPrograms')

  $startMenuLink = "$startMenuPath\Android Studio\Android Studio.lnk"

  if (Test-Path -Path $startMenuLink) {
    $startMenuFolder = Split-Path -Parent $startMenuLink
    Remove-Item -LiteralPath $startMenuFolder -ErrorAction SilentlyContinue -Force -Recurse | Out-Null
  }
}

if ($pinToTaskBar) {
  Install-ChocolateyPinnedTaskBarItem -TargetFilePath $executable.FullName
}
