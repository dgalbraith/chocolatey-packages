import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://www.mersenne.org'
$releases = "${domain}/download"

$re32         = '(?<=\s|)(?<Filename>p95v\d{3,}b\d{1,}\.win32\.zip)'
$re64         = '(?<=\s|)(?<Filename>p95v\d{3,}b\d{1,}\.win64\.zip)'
$reUrl32      = "https:.+$re32"
$reUrl64      = "https:.+$re64"
$reChecksum32 = '(?<=Checksum32:\s*)(?<Checksum>[^\s]+)'
$reChecksum64 = '(?<=Checksum64:\s*)(?<Checksum>[^\s]+)'
$reVersion    = '(?<=Prime95\sVersion\s)(?<Version>\d{2,}\.\d{1,})(\sbuild\s)(?<Build>\d{1,})'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "(?<=v)(?<Version>\d+\.\d+.\d+)" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($re32)"         = "$($Latest.FileName32)"
      "$($reUrl32)"      = "$($Latest.Url32)"
      "$($reChecksum32)" = "$($Latest.Checksum32)"
      "$($re64)"         = "$($Latest.FileName64)"
      "$($reUrl64)"      = "$($Latest.Url64)"
      "$($reChecksum64)" = "$($Latest.Checksum64)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "$($re32)" = "$($Latest.FileName32)"
      "$($re64)" = "$($Latest.FileName64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url32      = $downloadPage.links | where-object href -Match $re32 | select-object -First 1 -Expand href # first match only to avoid pulling in the legacy Windows XP version
  $filename32 = $url32 -split '/' | select-object -Last 1

  $url64      = $downloadPage.links | where-object href -Match $re64 | select-object -Expand href
  $fileName64 = $url64 -split '/' | select-object -Last 1

  $downloadPage.Content -Match $reversion
  $version = "$($Matches.Version).$($Matches.Build)"

  return @{
    Url32          = $url32
    Url64          = $url64
    FileName32     = $fileName32
    FileName64     = $fileName64
    FileType       = 'zip'
    Version        = $version
  }
}

update -ChecksumFor none -NoReadme
