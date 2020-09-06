$ErrorActionPreference = 'Stop'

$packageName    = $env:ChocolateyPackageName
$packageSearch  = "$packageName*"
$installerType  = 'exe'
$silentArgs     = '/S'
$validExitCodes = @(0)

$key = Get-ItemProperty -Path @( 'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                                 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*',
                                 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*' ) `
                        -ErrorAction:SilentlyContinue `
        | Where-Object   { $_.DisplayName -like $packageSearch }

$key | ForEach-Object { 
        $unFile = $_.UninstallString -replace "^`"?([^`"]+).*","`$1"
        Uninstall-ChocolateyPackage -PackageName "$packageName" `
                                    -FileType "$installerType" `
                                    -SilentArgs "$silentArgs" `
                                    -File "$unFile" `
                                    -ValidExitCodes $validExitCodes }

# Remove the stunnel service if it has been added - the uninstall (5.56) fails to do this
$service = Get-WmiObject -Class Win32_Service -Filter 'Name="stunnel"'
if ($service) { $service.delete() } 
