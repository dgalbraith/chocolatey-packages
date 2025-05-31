$ErrorActionPreference = 'Stop'

$silentArgs = '/quiet /norestart /IAcceptLicenseTerms'

[regex]$reedition = “(?i)^(Dev|Eval|ExprAdv)$”

$pp = Get-PackageParameters

# edition and PID parameters are mutually exclusive so only check/default
# the edition if no PID is provided
if ($null -eq $pp["PID"] -or $pp["PID"] -eq '') {
  # check the edition parameter and default to Eval if not supplied
  if ($null -eq $pp["Edition"] -or $pp["Edition"] -eq '') {
    $pp["Edition"] = 'Eval'
  }

  if ($pp['Edition'] -notmatch $reedition) {
    Write-Output "Unsupported edition $($pp.Edition)"
    exit (1)
  }
}

# append remaining package arguments to the silent arguments
$silentArgs += ($pp.GetEnumerator() | ForEach-Object { " /$($_.name)=`"$($_.value)`"" })

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  softwareName   = 'Microsoft SQL Server Reporting Services'
  url64bit       = 'https://download.microsoft.com/download/1/a/a/1aaa9177-3578-4931-b8f3-373b24f63342/SQLServerReportingServices.exe'
  checksum64     = '1BFB988A7F0E88CBBF001E036472289157FC6D248E10CA02566A9EF8C1C1B3CA'
  checksumType64 = 'sha256'
  silentArgs     = $silentArgs
  validExitCodes = @(0, 1641, 3010)
}

Install-ChocolateyPackage @packageArgs
