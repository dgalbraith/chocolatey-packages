import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/beekeeper-studio/beekeeper-studio/releases/latest"

$reInstall  = "((?<=\\|\d\/|\s)(B.+(?=Setup).+\.exe))"
$rePortable = "((?<='|\d\/|\s)(B.+(?=portable).+\.exe))"
$reVersion  = '(v|\[)(?<Version>([\d]+\.[\d]+\.[\d]+.*\d*))'

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
  
  $reUrl = '(B.+\.exe$)'
  $urls  = $downloadPage.links | where-object href -match $reUrl | select-object -expand href | foreach-object { $domain + $_ }
  
  $urlInstall      = $urls -match $reInstall | Select-Object -First 1
  $fileNameInstall = $urlInstall -split '/'  | Select-Object -Last 1

  $urlPortable      = $urls -match $rePortable | Select-Object -First 1
  $fileNamePortable = $urlPortable -split '/'  | Select-Object -Last 1

  $version = $downloadPage.Content -match $reversion | foreach-object { $Matches.Version }

  return @{
    UrlInstall       = $urlInstall
    FileNameInstall  = $fileNameInstall
    UrlPortable      = $urlPortable 
    FileNamePortable = $fileNamePortable
    Version          = $version
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none -NoCheckUrl -NoReadme
}
