$ErrorActionPreference = 'Stop'

Uninstall-BinFile -Name 'fluidsynth' -Path 'fluidsynth.exe'

# construct a regular expression that can be used to match the zip content file
$reZipContent   = "{0}-{1}-*.zip.txt" -f $env:ChocolateyPackageName, $env:ChocolateyPackageVersion
# locate the zip content file for the isntalled version in the package folder
$zipContentFile = Get-ChildItem -Path "$env:chocolateyPackageFolder\*" -Filter $reZipContent | Select-Object -ExpandProperty FullName

if ((Test-Path -path $zipContentFile)) {
  # extract the name of original .zip file that the contents was unpacked from and use the Chocolatey helper to remove the contants
  $zipPackage = $zipContentFile -Match '(?<ZipContentFile>^(?<Path>(?<Drive>[a-zA-Z]:)(?:\\[^:]+)?)\\(?<FileName>[^\\\n]+?)(?<Extension>\.[^.]*$|$))' | Foreach-Object { $Matches.FileName }
  Uninstall-ChocolateyZipPackage 'fluidsynth' $zipPackage
}

$installDir = Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName

# remove the install directory if it is empty - if any user files have been added they will be left behind
# noting that Uninstall-ChocolateyZipPackage will purge any files added beneath the extracted directory
# hierarchy
if ((Get-ChildItem -Recurse -Attributes !Directory $installDir | Measure-Object).Count -eq 0) {
  Remove-Item $installDir -Force  -Recurse -ErrorAction SilentlyContinue | Out-Null
}
