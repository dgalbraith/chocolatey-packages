import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/CoatiSoftware/Sourcetrail/releases/latest"

function global:au_BeforeUpdate {
  $Latest.URL32 = $Latest.URL32
  $Latest.URL64 = $Latest.URL64
  $Latest.FileType = 'zip'
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $reversion = '\/tag\/(?<Version>([\d]{4}\.[1-4]\.[\d]*))'

  $download_page.links | where-object href -match $reversion
  $version = $Matches.Version

  return @{
    Version = $version;
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none -NoCheckUrl -NoReadme
}
