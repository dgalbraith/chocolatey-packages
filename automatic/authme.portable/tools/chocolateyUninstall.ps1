$ErrorActionPreference = 'Stop'

Uninstall-Binfile -name 'Authme' -path 'Authme.exe'

Stop-Process -name 'Authme'

Get-ChildItem $env:chocolateyPackageFolder\* -include authme*.Install.txt, authme*.txt | Foreach-Object {
    $zipContentFile += Get-Content $_.fullname
  }

if (($null -ne $zipContentFile) -and ($zipContentFile.Length -ge 1)) {
  $zipTargetFile = $zipContentFile[0]
}

if (Test-Path -Path $zipTargetFile) {
  $unzipDirectory  = Split-Path $zipTargetFile
  $parentDirectory = Split-Path $unzipDirectory
}

Uninstall-ChocolateyZipPackage 'authme.portable' 'authme-3.3.4-*.zip'

# Uninstall-ChocolateyZipPackage only removes child directories unpacked from
# the archive so remove the main and parent directories if empty
if ((Get-ChildItem $unzipDirectory | Measure-Object).Count -eq 0) {
  Remove-Item $unzipDirectory -ErrorAction SilentlyContinue -Force | Out-Null
}

if ((Get-ChildItem $parentDirectory | Measure-Object).Count -eq 0) {
  Remove-Item $parentDirectory -ErrorAction SilentlyContinue -Force | Out-Null
}
