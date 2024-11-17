$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$installer  = Join-Path $toolsDir 'fend-1.5.5-windows-x64.msi'
$silentArgs = '/qn /norestart'

$pp = Get-PackageParameters

$noStartMenu  = $false

$local = @('Binaries')

if ($pp.count -gt 0) {
  $pp.GetEnumerator() | foreach-object {
  switch ($_.name) {
      'AddToDesktop' {
        $local += 'DesktopShortcut'
      }
      # No need to support the installer updating the path - a shim will be added instead
      # 'AddToPath' {
      #   $local += 'Binaries'
      # }
      'InstallDir' {
        $silentArgs += " APPLICATIONFOLDER=`"$($pp.InstallDir)`""
      }
      'NoStartMenu' {
        $noStartMenu = $true
      }
      Default {
        Write-Verbose("Unknown parameter $_ will be ignored")
      }
    }
  }
}

$silentArgs += " ADDLOCAL=`"{0}`"" -f ($local -join ",")

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileType       = 'msi'
  File64         = $installer
  SilentArgs     = $silentArgs
  ValidExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs

$uninstallKey    = Get-UninstallRegistryKey -SoftwareName 'fend'
$installLocation = $uninstallKey.InstallLocation
$executable      = Get-ChildItem $installLocation -include fend.exe -recurse

Install-Binfile -name 'fend' -path $executable

# the start menu entry for fend is added by default on install - remove if /NoStartMenu has been specifed
if ($noStartMenu) {
  $startMenuPath = [Environment]::GetFolderPath('CommonPrograms')
  $startMenuLink = "$startMenuPath\fend\fend.lnk"

  if (Test-Path -Path $startMenuLink) {
    Remove-Item $startMenuLink -ErrorAction SilentlyContinue -Force | Out-Null
  }
}
