import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/beekeeper-studio/beekeeper-studio/releases/latest"

$re64      = '(B.+Setup.+\.exe)'
$reversion = '(\/v|-)(?<Version>([\d]+\.[\d]+\.[\d]+))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reversion)" = "`${1}$($Latest.Version)"
    }

    "$($Latest.PackageName).nuspec" = @{
      "$($reversion)" = "`${1}$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "(\/v.+|\s)$($re64)"  = "`${1}$($Latest.Filename64)"
      "(Checksum64:\s)(.+)" = "`${1}$($Latest.Checksum64)"
      "$($reversion)"       = "`${1}$($Latest.Version)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "($re64)" = "$($Latest.FileName64)"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases
  $urls = $download_page.links | where-object href -match $reurl | select-object -expand href | foreach-object { $domain + $_ }

  $url64 = $urls -match $re64 | select-object -first 1
  $url64SegmentSize = $([System.Uri]$url64).Segments.Length
  $filename64 = $([System.Uri]$url64).Segments[$url64SegmentSize - 1]

  $url64 -match $reversion
  $version = $Matches.Version

  return @{
    FileName64 = $filename64
    Url64      = $url64
    Version    = $version
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
