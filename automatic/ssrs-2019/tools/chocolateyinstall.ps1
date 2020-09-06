$ErrorActionPreference = 'Stop';

$silentArgs = '/quiet /norestart /IAcceptLicenseTerms'

[regex]$reedition = “(?i)^(Dev|Eval|ExprAdv)$”

$pp = Get-PackageParameters

# check the edition parameter and default to Eval if not supplied
if ($null -eq $pp["Edition"] -or $pp["Edition"] -eq '') { $pp["Edition"] = 'Eval' }

if ($pp['Edition'] -notmatch $reedition) {
  Write-Output "Unsupported edition $($pp.Edition)"
  exit (1)
}

$pp.Remove['Edition']

# append remaining package arguments to the silent arguments
$silentArgs += ($pp.GetEnumerator() | ForEach-Object { " /$($_.name)=`"$($_.value)`"" })

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  softwareName   = 'Microsoft SQL Server Reporting Services'
  url64bit       = 'https://download.microsoft.com/download/1/a/a/1aaa9177-3578-4931-b8f3-373b24f63342/SQLServerReportingServices.exe'
  checksum64     = '9b1ca6117f6107056d63e522aa96f12d8ed7e2e92d11ba6245ffc7b78575a7dd'
  checksumType64 = 'sha256'
  silentArgs     = $silentArgs
  validExitCodes = @(0, 1641, 3010)
}

Install-ChocolateyPackage @packageArgs
