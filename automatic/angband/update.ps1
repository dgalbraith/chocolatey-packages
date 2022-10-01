import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/angband/angband/releases/latest"

$reFileName = "(?<FileName>(?<=\s|'|(?<=\d\/))(ang.+\.zip))"
$reChecksum = "(?<=Checksum:\s+)(?<Checksum>[^\s]*)"
$reVersion  = '(?<Version>(?<=v|\/)([\d]+\.[\d]+\.[\d]+(\.*\d*)))'

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
      "$($reFileName)" = "$($Latest.Filename32)"
    }

    ".\tools\chocolateyUninstall.ps1" = @{
      "$($reFileName)" = "$($Latest.Filename32)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reFileName)" = "$($Latest.Filename32)"
      "$($reChecksum)" = "$($Latest.Checksum32)"
      "$($reVersion)"  = "$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases
  $latestTag    = $downloadPage.BaseResponse.ResponseUri -split '\/' | Select-Object -Last 1
  $assetsUri    = "{0}/expanded_assets/{1}" -f ($releases.Substring(0, $releases.LastIndexOf('/'))), $latestTag
  $assetsPage   = Invoke-WebRequest -UseBasicParsing -Uri $assetsUri

  $url32      = $assetsPage.links | where-object href -match $reFileName | select-object -expand href | foreach-object { $domain + $_ }
  $fileName32 = $Matches.FileName

  $version = $filename32 -split '-' | select-object -skip 1 -first 1

  return @{
    Url32      = $url32
    FileName32 = $fileName32
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
