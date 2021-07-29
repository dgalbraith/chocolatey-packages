$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://redirector.gvt1.com/edgedl/android/studio/install/2020.3.1.22/android-studio-2020.3.1.22-windows.exe'
$checksum64 = '9a95e747121830b7a62f276438dd4df4390a4ccf785e09f226a9fb2ac0b576cf'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url64bit      = $url64
  softwareName  = 'Android Studio*'
  checksum64    = $checksum64
  checksumType64= 'sha256'
  silentArgs   = '/S'
  validExitCodes= @(0, 1223)
}

$pp = Get-PackageParameters

Install-ChocolateyPackage @packageArgs

if ($pp.PinnedToTaskbar) {
    Write-Host "Param: PinToTaskbar - Pinning Android Studio to Taskbar..."
    Install-ChocolateyPinnedTaskBarItem -TargetFilePath "${env:ProgramFiles}\Android\Android Studio\bin\studio64.exe"
}

if ($pp.AddToDesktop) {
    Write-Host "Param: AddToDesktop - Adding Android Studio Shortcut to Desktop..."

    $desktopPath = [Environment]::GetFolderPath("Desktop")

    Install-ChocolateyShortcut `
        -ShortcutFilePath "$desktopPath\Android Studio.lnk" `
        -TargetPath "${env:ProgramFiles}\Android\Android Studio\bin\studio64.exe"
}
