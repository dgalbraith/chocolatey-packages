import-module au

$ErrorActionPreference = 'Stop'

$releases = 'https://www.neckdiagrams.com/download'

$re32         = 'h.+32bit\.exe'
$re64         = 'h.+64bit\.exe'
$reFileName   = 'NeckDiagrams-(?<Version>\d+(\.\d+){1,3})-Setup-([32]|[64]){2}bit\.exe'
$reChecksum32 = "(?<=checksum32[^']*')(?<Checksum>[^']*)"
$reChecksum64 = "(?<=checksum64[^']*')(?<Checksum>[^']*)"
$reCopyright  = '(?<=Copyright\s+(?<CopyrightFrom>[\d]{4})-)(?<CopyrightTo>[\d]{4})'



function global:au_BeforeUpdate {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32 -Algorithm 'sha256'
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64 -Algorithm 'sha256'
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reCopyright)" = "$($Latest.UpdateYear)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($re32)"         = "$($Latest.Url32)"
      "$($re64)"         = "$($Latest.Url64)"
      "$($reChecksum32)" = "$($Latest.Checksum32)"
      "$($reChecksum64)" = "$($Latest.Checksum64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $urls = $downloadPage.links | where-object href -match $reFileName | select-object -expand href

  $url32      = $urls -match $re32 | select-object -first 1
  $filename32 = $url32 -split '/' | Select-Object -last 1
  $url64      = $urls -match $re64 | select-object -first 1
  $filename64 = $url64 -split '/' | Select-Object -last 1

  $updateYear = (Get-Date).ToString('yyyy')
  $version    = $Matches.Version

  return @{
    Filename32 = $filename32
    Url32      = $url32
    Version    = $version
    Url64      = $url64
    Filename64 = $filename64
    UpdateYear = $updateYear
  }
}

update -ChecksumFor none -NoReadme
