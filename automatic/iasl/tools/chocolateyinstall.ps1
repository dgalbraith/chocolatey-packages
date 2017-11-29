$ErrorActionPreference = 'Stop'

$packageName = 'iasl'
$url         = 'https://acpica.org/sites/acpica/files/iasl-win-20171110.zip'
$checksum    = 'EAF676C4F116C6EB749C27BACF8F406B922355A113D748CB9AFEE2217EA394E4'
$installDir  = 'C:\ASL'

$packageArgs = @{
  packageName    = $packageName
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'
  unzipLocation  = $installDir
}

if ($Env:ChocolateyPackageParameters -match '/InstallDir:\s*(.+)') {
    $installDir = $Matches[1]
    if ($installDir.StartsWith("'") -or $installDir.StartsWith('"')){  $installDir = $installDir -replace '^.|.$' }
    $parent = Split-Path $installDir
    mkdir -force $parent -ea 0 | out-null
}

Write-Host "Installing to '$installDir'"
Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyPath $installDir -PathType 'Machine'

Install-ChocolateyEnvironmentVariable `
  -VariableName 'IASL_PREFIX' `
  -VariableValue $installDir `
  -VariableType 'Machine'
