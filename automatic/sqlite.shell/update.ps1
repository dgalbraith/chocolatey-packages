import-module au

$ErrorActionPreference = 'STOP'

$base     = 'https://sqlite.org'
$releases = "${base}/download.html"

$toolsDir = Join-Path $(Split-Path -parent $MyInvocation.MyCommand.Definition) 'tools'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix

  $archive = Join-Path $toolsDir $Latest.FileName32 

  Write-Host('Extracting archive ' + $archive)
  Expand-Archive -Path $archive -DestinationPath $toolsDir

  Write-Host('Resolving executable')
  $executable = Get-ChildItem -Path $toolsDir 'sqlite?.exe' -Recurse
  Write-Host('Fully qualified executable is ' + $executable)
  $Latest.Executable = $executable.Name
  Write-Host('Executable name is ' + $Latest.Executable)
  $Latest.Checksum32 = (Get-Filehash -algorithm sha256 $executable).Hash
  Write-Host('Checksum for executable is ' + $Latest.Checksum32)

  Write-Host('Relocating executable to ' + $toolsDir)
  Move-Item -Path $executable $toolsDir

  Write-Host('Cleaning archive ' + $archive)
  Remove-Item $archive -ea 0 -Force | Out-Null
  Write-Host('Cleaning directory ' + $executable.Directory)
  Remove-Item -Path $executable.Directory -Recurse -Force | Out-Null
  Write-Host('Complete')
}

function global:au_SearchReplace {
  @{
     ".\README.md" = @{
       "(v)(?<Version>([\d]+\.[\d]+\.[\d]+\.*\d*))" = "`${1}$($Latest.Version)"
     }

    ".\legal\VERIFICATION.txt" = @{
      '(sqlite\d.exe)'          = "$($Latest.Executable)"
      '(sqlite-.+win32.+\.zip)' = "$($Latest.Filename32)"
      '(Checksum:\s*)(.+)'      = "`${1}$($Latest.Checksum32)"
    }
  }
}

function getVersion {
  param ([string] $rawVersion)

  # SQLite versions are encoded so that filenames sort in order of increasing version number when viewed using "ls".
  # For version 3.X.Y the filename encoding is 3XXYY00. For branch version 3.X.Y.Z, the encoding is 3XXYYZZ. 
  $rawVersion -match '(?<Series>[\d])(?<Major>[\d]{2})(?<Minor>[\d]{2})(?<Patch>[\d]{2})' | Out-Null
  
  $series = $Matches.Series
  $major  = $Matches.Major
  $minor  = $Matches.Minor
  $patch  = $Matches.Patch

  # check for and drop leading 0's if required
  if ($minor -like '0*') {
    $minor = $minor.substring(1,1)
  }

  if ($patch -like '0*') {
    $patch = $patch.substring(1,1)
  }

  # a version contains the branch element only if it is non-zero 
  if ($rawVersion -match '[\d]{5}00') {
    $version = '{0}.{1}.{2}'     -f $series, $major, $minor
  } else {
    $version = '{0}.{1}.{2}.{3}' -f $series, $major, $minor, $patch
  }

  return $version
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $downloadPage.Content -match '(?<DownloadUrl>(([\d]{4}\/(?<FileName>(.+tools-win32.+(?<Version>([\d]{7}))\.zip)))))'

  $url32      = ("{0}/{1}" -f $base, $Matches.DownloadUrl) 
  $fileName32 = $matches.FileName
  $rawVersion = $Matches.Version

  $version = getVersion($rawVersion)

  return @{
    FileType   = 'zip'
    FileName32 = $filename32
    Url32      = $url32
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
