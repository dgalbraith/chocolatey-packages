import-module chocolatey-au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/Nheko-Reborn/nheko/releases/latest"

$reChecksum = '(?<Checksum>((?<=Checksum:\s+).+))'
$reFileName = '(?<FileName>((?<=\s|\d\/|\\)nh*.+\.exe))'
$reVersion  = '(?<Version>((?<=\/v|-v)\d+\.\d+\.\d+))'

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
      "$($reFileName)" = "$($Latest.FileName32)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reFileName)" = "$($Latest.FileName32)"
      "$($reVersion)"  = "$($Latest.Version)"
      "$($reChecksum)" = "$($Latest.Checksum32)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases
  $latestTag    = $downloadPage.BaseResponse.ResponseUri -split '\/' | Select-Object -Last 1
  $assetsUri    = "{0}/expanded_assets/{1}" -f ($releases.Substring(0, $releases.LastIndexOf('/'))), $latestTag
  $assetsPage   = Invoke-WebRequest -UseBasicParsing -Uri $assetsUri

  $url32      = $assetsPage.links | where-object href -match $reFileName | select-object -expand href | foreach-object { $domain + $_ }
  $fileName32 = $url32 -split '/' | select-object -last 1
  $version    = $url32 -match $reVersion | foreach-object { $Matches.Version }

  return @{
    Url32      = $url32
    FileName32 = $fileName32
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
