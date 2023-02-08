$ErrorActionPreference = 'Stop'

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  PackageSearch  = 'jruby 9.4.1.0'
  SilentArgs     = '-q'
  ValidExitCodes = @(0)
}

$uninstallKeys = @( 'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                    'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*',
                    'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*')

Get-ItemProperty -Path $uninstallKeys -ErrorAction SilentlyContinue |
  Where-Object   { $_.DisplayName -like $packageArgs.PackageSearch } |
    ForEach-Object {
      $packageArgs.File = "$($_.UninstallString.Replace('"',''))"
      Uninstall-ChocolateyPackage @packageArgs
    }
