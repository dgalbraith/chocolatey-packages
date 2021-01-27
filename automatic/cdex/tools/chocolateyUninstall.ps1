$ErrorActionPreference = 'Stop';

Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
| Where-Object   {$_.PSChildName -like $env:ChocolateyPackageName} `
| ForEach-Object {Uninstall-ChocolateyPackage -PackageName $env:ChocolateyPackageName `
                                              -FileType 'exe' `
                                              -SilentArgs '/S' `
                                              -File "$($_.UninstallString.Replace('"',''))" `
                                              -ValidExitCodes @(0)}
