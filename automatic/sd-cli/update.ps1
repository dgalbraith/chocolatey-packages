import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}//chmln/sd/releases/latest"

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "([\d]+\.[\d]+\.[\d]+)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "(\s')(sd.+64.+\.zip)" = "`${1}$($Latest.Filename64)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "(sd\..+-windows-.+zip)"     = "$($Latest.Filename64)"
      "(\/v)([\d]+\.[\d]+\.[\d]+)" = "`${1}$($Latest.Version)"
      "(Checksum:\s)(.+)"          = "`${1}$($Latest.Checksum64)"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $reurl = '(sd.+-windows-.+zip)'
  $reversion = '(\/v(?<Version>([\d]+\.[\d]+\.[\d]+))\/)'

  $url64 = $download_page.links | where-object href -match $reurl | select-object -expand  href | select-object -first 1 | foreach-object { $domain + $_ }
  $url64SegmentSize = $([System.Uri]$url64).Segments.Length
  $filename64 = $([System.Uri]$url64).Segments[$url64SegmentSize - 1]

  $url64 -match $reversion
  $version = $Matches.Version

  return @{
    Filename64 = $filename64
    URL64 = $url64;
    Version = $version;
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
