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
  checksum      = '4f49964cc9cbac2b5d87bdc8f9526012e9c4b243d8b7d0c0bb51f254a721ca2e'
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
