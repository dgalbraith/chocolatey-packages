$ErrorActionPreference = 'Stop'

Stop-Process -name 'sqlite3' -ErrorAction SilentlyContinue

Uninstall-Binfile -name 'sqlite-shell-x64' -path 'sqlite3.exe'
