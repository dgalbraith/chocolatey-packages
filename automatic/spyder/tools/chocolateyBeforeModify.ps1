$ErrorActionPreference = 'Stop'

$process = Get-Process -Name 'spyder' -ErrorAction SilentlyContinue

if ($process) {
    Stop-Process -Id $process.Id -Force
}

Uninstall-BinFile -Name 'spyder' -Path 'spyder.exe' -ErrorAction SilentlyContinue
