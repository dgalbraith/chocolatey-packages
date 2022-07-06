import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/kyma-project/cli/releases/latest"

$reVersion = '(?<Version>([\d]+\.[\d]+\.[\d]+(\.[\d]+)?))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reversion)" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reversion)"        = "$($Latest.Version)"
      "(Checksum32:\s*)(.+)" = "`${1}$($Latest.Checksum32)"
      "(Checksum64:\s*)(.+)" = "`${1}$($Latest.Checksum64)"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $reurl = '(kyma_Windows_(i386|x86_64).+zip)'

  $re32 = 'i386\.zip'
  $re64 = 'x86_64\.zip'

  $urls = $download_page.links | where-object href -match $reurl | select-object -expand href | foreach-object { $domain + $_ }

  $url32 = $urls -match $re32 | select-object -first 1
  $url32SegmentSize = $([System.Uri]$url32).Segments.Length
  $filename32 = $([System.Uri]$url32).Segments[$url32SegmentSize - 1]

  $url64 = $urls -match $re64 | select-object -first 1
  $url64SegmentSize = $([System.Uri]$url64).Segments.Length
  $filename64 = $([System.Uri]$url64).Segments[$url64SegmentSize - 1]

  $url64 -match $reVersion
  $version = $Matches.Version

  return @{
    FileType   = 'zip'
    FileName32 = $filename32
    Url32      = $url32
    FileName64 = $filename64
    Url64      = $url64
    Version    = $version
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
