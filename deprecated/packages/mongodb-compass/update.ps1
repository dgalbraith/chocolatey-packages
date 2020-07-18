import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/mongodb-js/compass/releases/latest"

$reFile32  = '(mongodb-c.+\.msi)'
$reVersion = '(\/v|\[|e-)(?<Version>([\d]+\.[\d]+\.[\d]+))'

function global:au_BeforeUpdate {
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "`${1}$($Latest.Version)"
    }

    "$($Latest.PackageName).nuspec" = @{
      "$($reVersion)" = "`${1}$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases
  
  $urls  = $downloadPage.links | select-object -expand href | foreach-object { $domain + $_ }
  
  $url32 = $urls -match $reFile32 | select-object -first 1
  $urlSegmentSize32 = $([System.Uri]$url32).Segments.Length
  $fileName32       = $([System.Uri]$url32).Segments[$url32SegmentSize - 1]

  $url32 -match $reVersion
  $version = $Matches.Version

  return @{
    FileName32 = $fileName32
    Url32      = $url32
    Version    = $version
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none -NoCheckUrl -NoReadme
}
