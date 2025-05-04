import-module chocolatey-au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/AlDanial/cloc/releases/latest"

$reFile     = '(cloc-\d.+\d+\.exe)'
$reChecksum = '(?<=Checksum:\s+)(?<Checksum>[^\s]*)'
$reVersion  = '(?<=[-\/dgs][v\/-])(?<Version>([\d]+\.[\d]+))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    "$($Latest.PackageName).nuspec" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($refile)" = "$($Latest.FileName64)"
    }

    ".\tools\chocolateyUninstall.ps1" = @{
      "$($refile)" = "$($Latest.FileName64)"
    }

    ".\legal\VERIFICATION.txt"      = @{
      "$($reFile)"     = "$($Latest.FileName64)"
      "$($reVersion)"  = "$($Latest.Version)"
      "$($reChecksum)" = "$($Latest.Checksum64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases
  $latestTag    = $downloadPage.BaseResponse.ResponseUri -split '\/' | Select-Object -Last 1
  $assetsUri    = "{0}/expanded_assets/{1}" -f ($releases.Substring(0, $releases.LastIndexOf('/'))), $latestTag
  $assetsPage   = Invoke-WebRequest -UseBasicParsing -Uri $assetsUri

  $url64      = $assetsPage.links | where-object href -match $reFile | select-object -first 1 -expand href | foreach-object { $domain + $_ }
  $fileName64 = $url -split '/' | select-object -last 1

  $version = $assetsPage.Content -match $reversion | foreach-object { $Matches.Version }

  return @{
    FileName64 = $filename64
    Url64      = $url64
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
