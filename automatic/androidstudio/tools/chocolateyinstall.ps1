$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://redirector.gvt1.com/edgedl/android/studio/install/4.2.0.24/android-studio-ide-202.7322048-windows.exe'
$checksum64 = '1c145dd9a32521f148b7646fa773e645fde011d19db06d7dda575f391f9d9844'

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
