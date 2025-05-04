import-module chocolatey-au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/manga-download/hakuneko/releases/latest"

function global:au_BeforeUpdate {
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "(\/v|\[)([\d]+\.[\d]+\.[\d]+)" = "`${1}$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $reurl = 'https:\/\/.+(hakuneko.+windows-setup_(i386|amd64)\.exe)'
  $re64 = 'amd64\.exe'
  $reversion = '(\/v(?<Version>([\d]+\.[\d]+\.[\d]+)))'

  $urls = $download_page.links | where-object href -match $reurl | select-object -expand href

  $url64 = $urls -match $re64 | select-object -first 1

  $url64 -match $reversion
  $version = $Matches.Version

  return @{
    Version    = $version
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
