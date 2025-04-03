$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$file32 = Join-Path $toolsDir 'OpenVPN-2.6.14-I001-x86.msi'
$file64 = Join-Path $toolsDir 'OpenVPN-2.6.14-I001-amd64.msi'

$silentArgs = '/qn /norestart'

$pp = Get-PackageParameters

$addToDesktop = $false
$noStartMenu  = $false

$local = @()

if ($pp.count -gt 0) {
  $pp.GetEnumerator() | foreach-object {
  switch ($_.name) {
      'Gui' {
        Write-Verbose('The OpenVPN GUI by Mathias Sundman will be installed')
        $local += 'OpenVPN.GUI'
      }
      'GuiOnLogon' {
        Write-Verbose('The OpenVPN GUI will be launched on User logon')
        $local += 'OpenVPN.GUI.OnLogon'
      }
      'Service' {
        Write-Verbose('Background service wrapper (openvpnsrv2.exe) will be installed')
        $local += 'OpenVPN.Service'
      }
      'EasyRsa' {
        Write-Verbose('EasyRSA3 X.509 certificate management scripts will be installed')
        $local += 'EasyRSA'
      }
      'DcoDriver' {
        Write-Verbose('The OpenVPN Data Channel Offload network driver will be installed')
        $local += 'Drivers.OvpnDco'
      }
      'TapDriver' {
        Write-Verbose('The TAP-Windows driver (NDIS-6) will be installed')
        $local += 'Drivers.TAPWindows6'
      }
      'WintunDriver' {
        Write-Verbose('The layer 3 TUN driver will be installed')
        $local += 'Drivers.Wintun'
      }
      'PLAP' {
	      Write-Verbose('Pre-Logon Access-Provider will be activated')
	      $local += 'OpenVPN.PLAP.Register'
      }
      'Documentation' {
        Write-Verbose('OpenVPN documentation will be installed')
        $local += 'OpenVPN.Documentation'
      }
      'OpenSsl' {
        Write-Verbose('OpenSSL utilities for generating pubic/private key pairs wil be installed')
        $local += 'OpenSSL'
      }
      'SampleConfig' {
        Write-Verbose('Client/server configuration examples will be installed')
        $local += 'OpenVPN.SampleCfg'
      }
      'InstallDir' {
        Write-Verbose("$env:ChocolateyPackageName will be installed to $pp.InstallDir")
        $local += " /INSTALLDIR=`"$($pp.InstallDir)`""
      }
      'AddToDesktop' {
        Write-Verbose('A shortcut for the OpenVPN GUI will be left on the desktop')
        $addToDesktop = $true
      }
      'NoStartMenu' {
        Write-Verbose('The start menu folder for OpenVPN will be removed')
        $noStartMenu = $true
      }
      Default {
        Write-Verbose("Unknown parameter $_ will be ignored")
      }
    }
  }
} else {
  Write-Verbose('No parameters supplied - constructing a default parameter set')
  $local = @('OpenVPN.GUI','OpenVPN.Documentation','OpenVPN.SampleCfg','OpenVPN','OpenVPN.GUI.OnLogon','Drivers.OvpnDco','Drivers.TAPWindows6','Drivers','Drivers.Wintun','OpenSSL')
}

$silentArgs += " ADDLOCAL=`"{0}`"" -f ($local -join ",")

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileType       = 'msi'
  File           = $file32
  File64         = $file64
  SilentArgs     = $silentArgs
  ValidExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs

# the desktop shortcut for the OpenVPN GUI is added by default on install - remove unless retention has been specified with /AddToDesktop
if (-not $addToDesktop) {
  $desktopPath  = [Environment]::GetFolderPath('CommonDesktopDirectory')
  $shortcutPath = "$desktopPath\OpenVPN GUI.lnk"

  if (Test-Path -Path $shortcutPath) {
    Write-Verbose("Removing desktop shortcut $shortcutPath")
    Remove-Item $shortcutPath -ErrorAction SilentlyContinue -Force | Out-Null
  }
}

# the start menu folder for OpenVPN is added by default on install - remove if /NoStartMenu has been specifed
if ($noStartMenu) {
  $startMenuPath     = [Environment]::GetFolderPath('CommonPrograms')
  $openVpnFolderPath = "$startMenuPath\OpenVPN"

  if (Test-Path -Path $openVpnFolderPath) {
    Write-Verbose("Removing start menu folder $openVpnFolderPath")
    Remove-Item $openVpnFolderPath -Recurse -ErrorAction SilentlyContinue -Force | Out-Null
  }
}
