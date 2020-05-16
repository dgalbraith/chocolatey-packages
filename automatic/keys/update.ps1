import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/keys-pub/app/releases/latest"

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
      "(Keys.+msi)"                = "$($Latest.Filename64)"
      "(\/v)([\d]+\.[\d]+\.[\d]+)" = "`${1}$($Latest.Version)"
      "(Checksum:\s)(.+)"          = "`${1}$($Latest.Checksum64)"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $reurl = '(Keys.+msi)'
  $reversion = '(\/v(?<Version>([\d]+\.[\d]+\.[\d]+))\/)'

  $url = $download_page.links | where-object href -match $reurl | select-object -expand  href | select-object -first 1 | foreach-object { $domain + $_ }
  $urlSegmentSize = $([System.Uri]$url).Segments.Length
  $filename = $([System.Uri]$url).Segments[$urlSegmentSize - 1]

  $url -match $reversion
  $version = $Matches.Version

  return @{
    Filename = $filename
    URL = $url;
    Version = $version;
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
