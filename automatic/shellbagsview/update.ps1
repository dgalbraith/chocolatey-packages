import-module au

$ErrorActionPreference = 'STOP'

$base     = 'https://www.nirsoft.net/utils'
$releases = "${base}/shell_bags_view.html"

$reurl32   = '(shellbagsview\.zip)'
$reversion = '(v)(?<Version>([\d]+\.[\d]+))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$reversion" = "`${1}$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "(Checksum32:\s)(.+)" = "`${1}$($Latest.Checksum32)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url32      = $downloadPage.links | where-object href -match $reurl32 | select-object -expand href | foreach-object { $base + '/' + $_ } | select -First 1
  $filename32 = $url32 -split '/' | select -Last 1

  $downloadPage.Content -match $reversion
  $version = $Matches.Version

  return @{
    FileType   = 'zip'
    FileName32 = $filename32
    Url32      = $url32
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
