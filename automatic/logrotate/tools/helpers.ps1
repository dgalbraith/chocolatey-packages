$ErrorActionPreference = 'Stop'

function Test-LogRotateInstalled {
  $installKey = Get-InstallRegistryKey -SoftwareName 'LogRotate'

  if ($null -ne $installKey) {
    $installed = $true
  } else {
    $installed = $false
  }

  return $installed
}

function Stop-LogRotate {
  Stop-Process -Name logrotate -Force -ErrorAction SilentlyContinue
}
