$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$regRoot = 'HKCU:\Software\Sysinternals'
$regPkg  = @(
              'PsExec',
              'PsFile',
              'PsGetSid',
              'PsInfo',
              'PsKill',
              'PsList',
              'PsLoggedOn',
              'PsLogList',
              'PsPasswd',
              'PsService',
              'PsShutdown',
              'PsSuspend'
            )

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://download.sysinternals.com/files/PSTools.zip'
  checksum      = '2b10b3d9dae0403b06d90b13bfb53e723a8b14a788f78cdfd43a445d8991415e'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$pp = Get-PackageParameters

$acceptEula = $false

if ($pp.count -gt 0) {
  $pp.GetEnumerator() | foreach-object {
  
    switch ($_.name) {
      'AcceptEula' {
        $acceptEula = $true
      } 
      Default {
        Write-Verbose("Unknown parameter $_ will be ignored")
      }
    }
  }
  
  if ($true -eq $acceptEula) {
   
    if (!(Test-Path $regRoot)) {
      New-Item -Path "$regRoot" | Out-Null
    }
    
    foreach ($pkg in $regPkg) {
      $regPath = Join-Path $regRoot $pkg
      
      if (!(Test-Path $regPath)) {
        New-Item -Path "$regRoot" -Name "$pkg" | Out-Null
      }
      
      Set-ItemProperty -Path "$regPath" -Name EulaAccepted -Value 1
      
      if ((Get-ItemProperty -Path "$regPath").EulaAccepted -ne 1) {
        throw "Failure updating registry to indicate EULA acceptance"
      }
    }
  }
}
