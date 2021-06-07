$ErrorActionPreference = 'Stop'

Get-ChildItem $env:chocolateyPackageFolder\* -include sqljdbc*.Install.txt, sqljdbc*.txt | Foreach-Object {
    $zipContentFile += Get-Content $_.fullname 
  }

if (($null -ne $zipContentFile) -and ($zipContentFile.Length -ge 1)) {
  $zipTargetFile = $zipContentFIle[0]
}

if (Test-Path -Path $zipTargetFile) {
  $unzipDirectory  = Split-Path $zipTargetFile 
  $parentDirectory = Split-Path $unzipDirectory
}

Uninstall-ChocolateyZipPackage 'sqljdbc' 'sqljdbc_7.0.0.0_*.zip'

# Uninstall-ChocolateyZipPackage only removes child directories unpacked from
# the archive so remove the main and parent directories if empty
if ((Get-ChildItem $unzipDirectory | Measure-Object).Count -eq 0) {
  Remove-Item $unzipDirectory -ErrorAction SilentlyContinue -Force | Out-Null
}

if ((Get-ChildItem $parentDirectory | Measure-Object).Count -eq 0) {
  Remove-Item $parentDirectory -ErrorAction SilentlyContinue -Force | Out-Null    
}
