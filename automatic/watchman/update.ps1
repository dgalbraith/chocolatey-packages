import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/facebook/watchman/releases/latest"

$re64      = '(watchman-v.*windows\.zip)'
$reVersion = '(\/v|e-)(?<Version>([\d]+\.[\d]+\.[\d]+\.[\d]+))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "`${1}$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($re64)"          = "$($Latest.Filename64)"
      "$($reVersion)"     = "`${1}$($Latest.Version)"
      "(Checksum:\s)(.+)" = "`${1}$($Latest.Checksum64)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "(\s')$($re64)" = "`${1}$($Latest.Filename64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases
  $urls = $downloadPage.links | select-object -expand href | foreach-object { $domain + $_ }

  $url64            = $urls -match $re64 | select-object -first 1
  $url64SegmentSize = $([System.Uri]$url64).Segments.Length
  $filename64       = $([System.Uri]$url64).Segments[$url64SegmentSize - 1]

  $url64 -match $reVersion
  $version = $Matches.Version

  return @{
    FileType   = 'zip'
    FileName64 = $filename64
    Url64      = $url64
    Version    = $version
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
