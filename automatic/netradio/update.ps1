import-module chocolatey-au

$ErrorActionPreference = 'STOP'

$domain   = 'https://www.ophthalmostar.de'
$releases = "${domain}/freeware/"

$reChecksum64 = "(?<=Checksum64\s*[:=]\s*'?)(?<Checksum>[^'\s]+)"
$reVersion    = '(?<=[>\[v])(?<Version>([\d]+\.[\d]+\.[\d]+(?:\.\d+)?))(?![<,])'

function global:au_BeforeUpdate {
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reVersion)"   = "$($Latest.Version)"
    }

    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $version = $downloadPage -match $reVersion | foreach-object { $Matches.Version }

  return @{
    Version = $version
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none -NoCheckUrl -NoReadme
}
