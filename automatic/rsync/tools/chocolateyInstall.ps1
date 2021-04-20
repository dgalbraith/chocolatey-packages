$ErrorActionPreference = 'Stop'

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  Write-Warning "Itefix no longer provide a 32-bit build of cwRsync"
  Write-Warning "32 bit users should specify version 5.5.0.20190204"
  Write-Error -Message "32-bit version of rsync not available" -Category ResourceUnavailable
}

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$archive  = Join-Path $toolsDir 'cwrsync_6.2.0_x64_free.zip'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

$files = Get-ChildItem $toolsDir -include *.exe -recurse

foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

$pp = Get-PackageParameters

if ($pp.User) {
  $variableType = 'User'
} else {
  $variableType = 'Machine'
}

$cwrsync_home = $archive -split '.zip' | Select-Object -first 1
$rsync_bat    = Join-Path $toolsDir 'rsync.bat'

$environmentArgs = @{
    VariableName  = 'CWRSYNC_HOME'
    VariableValue = $cwrsync_home
    VariableType  = $variableType
}

Install-ChocolateyEnvironmentVariable @environmentArgs

Install-BinFile -Name 'rsync' -Path $rsync_bat

$files = Get-ChildItem $toolsDir -include *.exe -recurse

foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

Update-SessionEnvironment
