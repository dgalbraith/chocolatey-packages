$ErrorActionPreference = 'Stop'


$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageDir = "$($toolsDir | Split-Path -parent)"

$fendLink        = 'fend.lnk'
$desktop         = [Environment]::GetFolderPath('Desktop')
$commonDesktop   = [Environment]::GetFolderPath('CommonDesktopDirectory')
$startMenu       = [Environment]::GetFolderPath('StartMenu')
$commonStartMenu = [Environment]::GetFolderPath('CommonStartMenu')

$paths = @(
  (Join-Path $desktop $fendLink),
  (Join-Path $commonDesktop $fendLink),
  (Join-Path $startMenu $fendLink),
  (Join-Path $commonStartMenu $fendLink)
)

$paths.GetEnumerator() | ForEach-Object {
  if (Test-Path -Path $_) {
    Remove-Item $_ -ErrorAction SilentlyContinue -Force | Out-Null
  }
}

Uninstall-BinFile -Name 'fend' -Path 'fend.exe'

$zipFileName = "$packageDir/fend-1.1.1-windows-x64-exe.zip"

$packageArgs = @{
  PackageName = $env:ChocolateyPackageName
  ZipFileName = $zipFileName
}

Uninstall-ChocolateyZipPackage @packageArgs

Remove-Item "$zipFileName.txt" -Force -ErrorAction SilentlyContinue | Out-Null
