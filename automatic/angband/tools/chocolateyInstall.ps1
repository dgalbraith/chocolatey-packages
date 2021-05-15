$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$archive  = Join-Path $toolsDir 'Angband-4.2.2-win.zip'

$installDir = Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $installDir
}

Get-ChocolateyUnzip @unzipArgs

$executable = Get-ChildItem $installDir -include angband.exe -recurse

$pp = Get-PackageParameters

if ($pp.AddToDesktop) {
    if ($pp.User) {
        $desktopPath  = [Environment]::GetFolderPath('Desktop')
    } else {
        $desktopPath = [Environment]::GetFolderPath('CommonDesktopDirectory')
    }

    $shortcutPath = Join-Path $desktopPath 'Angband.lnk'

    Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $executable
}

Install-Binfile -Name 'Angband' -Path $executable -UseStart

$files = Get-ChildItem $installDir -recurse -include 'delete.me'

foreach ($file in $files) {
  Remove-Item $file -Force -ErrorAction SilentlyContinue | Out-Null
}

$instance  = '{0}-{1}' -f $Env:ChocolateyPackageName, $Env:ChocolateyPackageVersion

$source = Join-Path $installDir 'user'

if (Test-Path -Path $source) {
  $target = Join-Path $installDir $instance | Join-Path -ChildPath 'lib'
  
  Copy-Item -Force -Recurse -Path $source $target
  Remove-Item -Force -Recurse $source
}
