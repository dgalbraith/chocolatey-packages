import-module au

$ErrorActionPreference = 'STOP'

$base     = 'https://sqlite.org'
$releases = "${base}/download.html"

$reArchive    = '(sqlite-.+win.+\.zip)'
$reChecksum   = '(?<=Checksum:\s*)((?<Checksum>([^\s]+)))'
$reDownload   = '(?<DownloadUrl>(([\d]{4}\/(?<FileName>(.+tools-win-x64.+(?<Version>([\d]{7}))\.zip)))))'
$reExecutable = '(sqlite\d_analyzer\.exe)'
$reRawVersion = '(?<Series>[\d])(?<Major>[\d]{2})(?<Minor>[\d]{2})(?<Patch>[\d]{2})'
$reVersion    = '(?<=v)(?<Version>([\d]+\.[\d]+\.[\d]+\.*\d*))'

$toolsDir = Join-Path $(Split-Path -parent $MyInvocation.MyCommand.Definition) 'tools'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix

  $archive = Join-Path $toolsDir $Latest.FileName64

  Expand-Archive -Path $archive -DestinationPath $toolsDir -Force

  $executable = Get-ChildItem -Recurse -Path $toolsDir 'sqlite?_analyzer.exe'
  $Latest.Executable = $executable.Name
  $Latest.Checksum64 = (Get-Filehash -algorithm sha256 $executable.FullName).Hash

  Move-Item -Path $executable.FullName $toolsDir

  Get-ChildItem $executable.Directory -Recurse -Exclude ('*.ps1', 'sqlite?_analyzer.exe') | Remove-Item -Force -ea 0 | Out-Null
}

function global:au_SearchReplace {
  @{
     ".\README.md" = @{
       "$reVersion" = "$($Latest.Version)"
     }

    ".\legal\VERIFICATION.txt" = @{
      "$reExecutable" = "$($Latest.Executable)"
      "$reArchive"    = "$($Latest.Filename64)"
      "$reChecksum"   = "$($Latest.Checksum64)"
    }
  }
}

function getVersion {
  param ([string] $rawVersion)

  # SQLite versions are encoded so that filenames sort in order of increasing version number when viewed using "ls".
  # For version 3.X.Y the filename encoding is 3XXYY00. For branch version 3.X.Y.Z, the encoding is 3XXYYZZ.
  $rawVersion -match $reRawVersion | Out-Null

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

  $downloadPage.Content -match $reDownload

  $url64      = ("{0}/{1}" -f $base, $Matches.DownloadUrl)
  $fileName64 = $matches.FileName
  $rawVersion = $Matches.Version

  $version = getVersion($rawVersion)

  return @{
    FileType   = 'zip'
    FileName64 = $filename64
    Url64      = $url64
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
