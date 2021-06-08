$ErrorActionPreference = 'Stop'

Uninstall-BinFile -Name 'Flashpoint' -Path 'Flashpoint.cmd'

$packageArgs = @{
  PackageName = $env:ChocolateyPackageName
  ZipFileName = 'Flashpoint 10 Infinity.exe'
}

UnInstall-ChocolateyZipPackage @packageArgs

$installDir = Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName

Remove-Item $installDir -Force  -Recurse -ErrorAction SilentlyContinue | Out-Null
