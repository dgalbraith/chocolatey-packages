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
      "(Keys.+msi)" = "$($Latest.Filename32)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "(\/v.*\/)(Keys.+msi)"       = "`${1}$($Latest.Filename32)"
      "(Checksum:\s)(.+)"          = "`${1}$($Latest.Checksum32)"
      "(\/v)([\d]+\.[\d]+\.[\d]+)" = "`${1}$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $reurl = '(Keys.+msi)'
  $reversion = '(\/v(?<Version>([\d]+\.[\d]+\.[\d]+))\/)'

  $url32 = $download_page.links | where-object href -match $reurl | select-object -expand  href | select-object -first 1 | foreach-object { $domain + $_ }
  $url32SegmentSize = $([System.Uri]$url32).Segments.Length
  $fileName32       = $([System.Uri]$url32).Segments[$urlSegmentSize - 1]

  $url32 -match $reversion
  $version = $Matches.Version

  return @{
    FileName32 = $fileName32
    Url32      = $url32
    Version    = $version
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
