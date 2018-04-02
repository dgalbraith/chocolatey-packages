$ErrorActionPreference = 'Stop'

$packageName = 'iasl'
$url = 'https://acpica.org/sites/acpica/files/iasl-win-20180313.zip'
$checksum = '02374c465534fda60aa9a22d33ad9fe1033d4bd223bbe3f2652cb9bbf78b40e6'
$installDir = 'C:\ASL'

$packageArgs = @{
    packageName   = $packageName
    url           = $url
    checksum      = $checksum
    checksumType  = 'sha256'
    unzipLocation = $installDir
}

if ($Env:ChocolateyPackageParameters -match '/InstallDir:\s*(.+)') {
    $installDir = $Matches[1]
    if ($installDir.StartsWith("'") -or $installDir.StartsWith('"')) {  $installDir = $installDir -replace '^.|.$' }
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
