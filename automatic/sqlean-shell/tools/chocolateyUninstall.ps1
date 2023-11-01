$ErrorActionPreference = 'Stop'

Stop-Process -name 'sqlean' -ErrorAction SilentlyContinue

Uninstall-Binfile -name 'sqlean-shell' -path 'sqlean.exe'
