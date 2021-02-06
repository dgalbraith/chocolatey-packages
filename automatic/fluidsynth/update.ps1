import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/FluidSynth/fluidsynth/releases/latest"

$refile32  = '(fluidsynth-[^\s]+x86\.zip)'
$refile64  = '(fluidsynth-[^\s]+x64\.zip)'
$reversion = '(v)(?<Version>([\d]+\.[\d]+\.[\d]+))'

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
      "$($refile32)" = "$($Latest.FileName32)"
      "$($refile64)" = "$($Latest.FileName64)"
    }

    ".\legal\VERIFICATION.txt"      = @{
      "$($refile32)"        = "$($Latest.FileName32)"
      "$($refile64)"        = "$($Latest.FileName64)"
      "$($reversion)"       = "`${1}$($Latest.Version)"
      "(Checksum32:\s)(.+)" = "`${1}$($Latest.Checksum32)"
      "(Checksum64:\s)(.+)" = "`${1}$($Latest.Checksum64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url32      = $downloadPage.links | where-object href -match $refile32 | select-object -expand href | foreach-object { $domain + $_ } | select -First 1
  $filename32 = $url32 -split '/' | select-object -Last 1

  $url64      = $downloadPage.links | where-object href -match $refile64 | select-object -expand href | foreach-object { $domain + $_ } | select -First 1
  $filename64 = $url64 -split '/' | select-object -Last 1

  $version = $downloadPage.Content -match $reversion | foreach-object { $Matches.Version }

  return @{
    FileName32 = $filename32
    Url32      = $url32
    FileName64 = $filename64
    Url64      = $url64
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme -NoCheckUrl
