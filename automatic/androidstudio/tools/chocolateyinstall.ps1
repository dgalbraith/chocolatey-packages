$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://redirector.gvt1.com/edgedl/android/studio/install/4.1.0.19/android-studio-ide-201.6858069-windows.exe'
$checksum64 = '127bf487a87267522fa3532b980298b667eb7acde68d805084e9cf1cfc608251'

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
