import-module au

$ErrorActionPreference = 'Stop'

$domain   = 'https://github.com'
$releases = "${domain}/FluidSynth/fluidsynth/releases/latest"

$reFile32     = '(fluidsynth-[^\s]+x86\.zip)'
$reFile64     = '(fluidsynth-[^\s]+x64\.zip)'
$reChecksum32 = '(?<=Checksum32:\s*)((?<Checksum>([^\s].+)))'
$reChecksum64 = '(?<=Checksum64:\s*)((?<Checksum>([^\s].+)))'
$reVersion    = '(?<=v)(?<Version>([\d]+\.[\d]+\.[\d]+\.?[\d]*))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($reFile32)" = "$($Latest.FileName32)"
      "$($reFile64)" = "$($Latest.FileName64)"
    }

    ".\legal\VERIFICATION.txt"      = @{
      "$($reFile32)"     = "$($Latest.FileName32)"
      "$($reFile64)"     = "$($Latest.FileName64)"
      "$($reVersion)"    = "$($Latest.Version)"
      "$($reChecksum32)" = "$($Latest.Checksum32)"
      "$($reChecksum64)" = "$($Latest.Checksum64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases
  $latestTag    = $downloadPage.BaseResponse.ResponseUri -split '\/' | Select-Object -Last 1
  $assetsUri    = "{0}/expanded_assets/{1}" -f ($releases.Substring(0, $releases.LastIndexOf('/'))), $latestTag
  $assetsPage   = Invoke-WebRequest -UseBasicParsing -Uri $assetsUri

  $url32      = $assetsPage.links | where-object href -match $reFile32 | select-object -expand href | foreach-object { $domain + $_ } | select-object -First 1
  $filename32 = $url32 -split '/' | select-object -Last 1

  $url64      = $assetsPage.links | where-object href -match $reFile64 | select-object -expand href | foreach-object { $domain + $_ } | select-object -First 1
  $filename64 = $url64 -split '/' | select-object -Last 1

  $version = $url64 -match $reVersion | foreach-object { $Matches.Version }

  return @{
    FileName32 = $filename32
    Url32      = $url32
    FileName64 = $filename64
    Url64      = $url64
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
