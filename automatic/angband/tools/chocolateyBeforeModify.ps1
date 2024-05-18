$ErrorActionPreference = 'Stop'

$installDir  = Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName
$instance    = '{0}-{1}' -f  $Env:ChocolateyPackageName,$Env:ChocolateyPackageVersion
$instanceDir = Join-Path $installDir $instance

$source = $instanceDir | Join-Path -ChildPath 'lib' | Join-Path -ChildPath 'user'

if (Test-Path -Path $source) {
  $target = $installDir

  if (-Not (Test-Path -Path $target)) {
      New-Item -ItemType directory -Path $target
  }

  Move-Item -Path $source -Destination $target -Force
}

$desktopPath  = [Environment]::GetFolderPath('Desktop')
$shortcutPath = "$desktopPath\Angband.lnk"

if (Test-Path -Path $shortcutPath) {
  Remove-Item $shortcutPath -ErrorAction SilentlyContinue -Force | Out-Null
}

$desktopPath = [Environment]::GetFolderPath('CommonDesktopDirectory')
$shortcutPath = "$desktopPath\Angband.lnk"

if (Test-Path -Path $shortcutPath) {
  Remove-Item $shortcutPath -ErrorAction SilentlyContinue -Force | Out-Null
}
