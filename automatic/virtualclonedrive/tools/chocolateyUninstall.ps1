$ErrorActionPreference = 'Stop'

Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
    | where-object   { $_.PSChildName -like $($env:ChocolateyPackageName) } `
    | foreach-object { $_.UninstallString } `
    | foreach-object { $_ -match '(?<Application>(.+\"))\s(?<Directory>(\/D.+))' } `
    | foreach-object { Uninstall-ChocolateyPackage -PackageName $env:ChocolateyPackageName `
                                                   -FileType 'exe' `
                                                   -SilentArgs "/S $($Matches.Directory)" `
                                                   -File "$($Matches.Application)" `
                                                   -ValidExitCodes @(0) }
