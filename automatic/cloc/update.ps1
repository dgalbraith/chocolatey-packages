import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/AlDanial/cloc/releases/latest"

$refile    = '(cloc-\d.+\d+\.exe)'
$reversion = '(-v|\/|s-)(?<Version>([\d]+\.[\d]+))'

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

    ".\tools\chocolateyInstall.ps1" = @{
      "$($refile)" = "$($Latest.FileName32)"
    }

    ".\tools\chocolateyUninstall.ps1" = @{
      "$($refile)" = "$($Latest.FileName32)"
    }

    ".\legal\VERIFICATION.txt"      = @{
      "$($refile)"         = "$($Latest.FileName32)"
      "$($reversion)"      = "`${1}$($Latest.Version)"
      "(Checksum:\s*)(.*)" = "`${1}$($Latest.Checksum32)"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $urls           = $download_page.links | where-object href -match $reurl | select-object -expand href | foreach-object { $domain + $_ }
  $url            = $urls -match $re | select-object -first 1
  $urlSegmentSize = $([System.Uri]$url).Segments.Length
  $filename       = $([System.Uri]$url).Segments[$urlSegmentSize - 1]

  $url -match $reversion
  $version = $Matches.Version

  return @{
    FileName32 = $filename
    Url32      = $url
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
