import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/manga-download/hakuneko/releases/latest"

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "(\/v)([\d]+\.[\d]+\.[\d]+)" = "`${1}$($Latest.Version)"
    }

    ".\README.md" = @{
      "([\d]+\.[\d]+\.[\d]+)" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "([\d]+\.[\d]+\.[\d]+)" = "$($Latest.Version)"
      "(Checksum32:\s)(.+)"   = "`${1}$($Latest.Checksum32)"
      "(Checksum64:\s)(.+)"   = "`${1}$($Latest.Checksum64)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "(haku.+i386\.exe)"  = "$($Latest.FileName32)"
      "(haku.+amd64\.exe)" = "$($Latest.FileName64)"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $reurl = 'https:\/\/.+(hakuneko.+windows-setup_(i386|amd64)\.exe)'
  $re32 = 'i386\.exe'
  $re64 = 'amd64\.exe'
  $reversion = '(\/v(?<Version>([\d]+\.[\d]+\.[\d]+)))'

  $urls = $download_page.links | where-object href -match $reurl | select-object -expand href

  $url32 = $urls -match $re32 | select-object -first 1
  $url32SegmentSize = $([System.Uri]$url32).Segments.Length
  $filename32 = $([System.Uri]$url32).Segments[$url32SegmentSize - 1]

  $url64 = $urls -match $re64 | select-object -first 1
  $url64SegmentSize = $([System.Uri]$url64).Segments.Length
  $filename64 = $([System.Uri]$url64).Segments[$url64SegmentSize - 1]

  $url32 -match $reversion
  $version = $Matches.Version

  return @{
    FileType   = 'exe'
    FileName32 = $filename32
    Url32      = $url32
    FileName64 = $filename64
    Url64      = $url64
    Version    = $version
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
