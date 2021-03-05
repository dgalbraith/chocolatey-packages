$ErrorActionPreference = 'Stop'

Uninstall-BinFile -Name 'Flashpoint' -Path 'Flashpoint.cmd'

$packageArgs = @{
  PackageName = $env:ChocolateyPackageName
  ZipFileName = (Get-ChildItem -path $env:ChocolateyPackageFolder -include 'F*.7z.txt' -name).TrimEnd('.txt')
}

UnInstall-ChocolateyZipPackage @packageArgs

$installDir = Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName

Remove-Item $installDir -Force  -Recurse -ErrorAction SilentlyContinue | Out-Null
