import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/beekeeper-studio/beekeeper-studio/releases/latest"

$re64      = '(B.+\.exe)'
$reversion = '(\/v|\[|-)(?<Version>([\d]+\.[\d]+\.[\d]+))'

function global:au_BeforeUpdate {
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reversion)" = "`${1}$($Latest.Version)"
    }

    "$($Latest.PackageName).nuspec" = @{
      "$($reversion)" = "`${1}$($Latest.Version)"
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

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none -NoCheckUrl -NoReadme
}
