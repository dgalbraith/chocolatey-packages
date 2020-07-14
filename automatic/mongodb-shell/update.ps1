import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/mongodb-js/mongosh/releases/latest"

$re64      = '(mongosh-.+win32\.zip)' # despite the filename the archive contains a 64-bit executable
$reversion = '((\/|%20|-|v)(?<Version>([\d]+\.[\d]+\.[\d]+)))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "([\d]+\.[\d]+\.[\d]+)" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($re64)"                   = "$($Latest.Filename64)"
      "(\/v)([\d]+\.[\d]+\.[\d]+)" = "`${1}$($Latest.Version)"
      "(Checksum:\s)(.+)"          = "`${1}$($Latest.Checksum64)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "(\s')$($re64)" = "`${1}$($Latest.Filename64)"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases
  $urls = $download_page.links | select-object -expand href | foreach-object { $domain + $_ }

  $url64            = $urls -match $re64 | select-object -first 1
  $url64SegmentSize = $([System.Uri]$url64).Segments.Length
  $filename64       = $([System.Uri]$url64).Segments[$url64SegmentSize - 1]

  $url64 -match $reversion
  $version = $Matches.Version

  return @{
    FileType   = 'zip'
    FileName64 = $filename64
    Url64      = $url64
    Version    = $version
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
