$ErrorActionPreference = 'Stop'
$packageName= 'mame' 

Remove-Item "$ENV:Public\Desktop\MAME.lnk" -Force -ErrorAction SilentlyContinue
Remove-Item "$ENV:ProgramData\Microsoft\Windows\Start Menu\Programs\MAME.lnk" -Force -ErrorAction SilentlyContinue
