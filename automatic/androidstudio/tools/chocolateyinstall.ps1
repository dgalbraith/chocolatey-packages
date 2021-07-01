$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://redirector.gvt1.com/edgedl/android/studio/install/4.2.2.0/android-studio-ide-202.7486908-windows.exe'
$checksum64 = '517305de6a9558a7075201dffc2483dc9cc46e31632d781172bd8385c0f2c526'

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
