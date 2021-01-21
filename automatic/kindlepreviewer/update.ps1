import-module au

$ErrorActionPreference = 'STOP'

$releases = 'https://www.amazon.com/gp/feature.html?docId=1000765261'

$re64      = '(?<Url>(https://s.+exe))'
$reVersion = '(>K|-v).*?(?<Version>(\d\.\d+))'

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "`${1}$($Latest.Version)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "(url\s*=\s*)('.*')"      = "`$1'$($Latest.Url64)'"
      "(checksum\s*=\s*)('.*')" = "`$1'$(Get-RemoteChecksum $Latest.Url64)'"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases -MaximumRedirection 0 -ErrorAction SilentlyContinue

  $downloadPage.Content -match $re64
  $url64 = $Matches.Url

  $downloadPage.Content -match $reVersion
  $version = $Matches.Version

  return @{
    URL64          = $url64
    ChecksumType64 = 'sha256'
    Version        = $version
  }
}

update -ChecksumFor none -NoReadme
