import-module au

$ErrorActionPreference = 'STOP'

$releases = 'https://tunein.com/download/windows'

$reversion = '(?<Version>([\d]+\.[\d]+\.[\d]+))'
$refile    = '(?<Executable>(T.*\.exe))'

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reversion)" = "$($Latest.Version)"
    }

    ".\README.md" = @{
      "$($reversion)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "(\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.Url)'"
      "(\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
    }
  }
}

function global:au_GetLatest {
  $request  = [System.Net.WebRequest]::Create($releases)
  $response = $request.GetResponse()

  $url = $response.ResponseUri

  $url -Match $refile
  $filename = $Matches.Executable

  $url -Match $reversion
  $version  = $Matches.Version

  return @{
    Url      = $url;
    Filename = $filename;
    Version  = $version;
  }
}

update -ChecksumFor 32 -NoCheckUrl -NoReadme
