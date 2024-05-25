$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$regRoot = 'HKCU:\Software\Sysinternals'
$regPkg  = 'PsPing'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://download.sysinternals.com/files/PSTools.zip'
  checksum      = 'a9ca77dfe03ce15004157727bb43ba66f00ceb215362c9b3d199f000edaa8d61'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

Get-ChildItem $toolsDir -Recurse -Exclude ('*.ps1', 'psping.exe', 'psping64.exe') | Remove-Item -Force -ea 0 | Out-Null

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
    
    $regPath = Join-Path $regRoot $regPkg
      
    if (!(Test-Path $regPath)) {
      New-Item -Path "$regRoot" -Name "$regPkg" | Out-Null
    }
      
    Set-ItemProperty -Path "$regPath" -Name EulaAccepted -Value 1
      
    if ((Get-ItemProperty -Path "$regPath").EulaAccepted -ne 1) {
      throw "Failure updating registry to indicate EULA acceptance"
    }
  }
}
