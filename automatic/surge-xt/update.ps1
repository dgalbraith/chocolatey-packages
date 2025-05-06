import-module chocolatey-au

Import-Module ..\..\scripts\chocolatey-helpers\Chocolatey-Helpers.psd1

$ErrorActionPreference = 'STOP'

$domain     = 'https://github.com'
$user       = 'surge-synthesizer'
$repository = 'releases-xt'

$reChecksum32 = "(?<=checksum\s*[:=]\s*'?)(?<Checksum>[^'\s]+)"
$reChecksum64 = "(?<=checksum64\s*[:=]\s*'?)(?<Checksum>[^'\s]+)"
$reCopyright  = '(?<=(Copyright.+(?<CopyrightFrom>[\d]{4})-))(?<CopyrightTo>[\d]{4})'
$reInstall32  = '(?<=\/|\s)(?<Filename>surge-xt-win32.+\.exe)'
$reInstall64  = '(?<=\/|\\|\s)(?<Filename>surge-xt-win64.+\.exe)'
$rePortable   = '(?<=\/|\s)(?<Filename>surge-xt-win64.+portable.+\.zip)'
$reVersion    = '(?<=v|\[|\/)(?<Version>([\d]+\.[\d]+\.[\d]+(?:\.\d+)?))'

function global:au_BeforeUpdate {
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reCopyright)" = "$($Latest.UpdateYear)"
      "$($reVersion)"   = "$($Latest.Version)"
    }

    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Get-GitHubLatestReleasePage -User $user -Repository $repository

  $urlInstall32      = $downloadPage.links | Where-Object href -match $reInstall32 | Select-Object -expand href | ForEach-Object { $domain + $_ }
  $fileNameInstall32 = $Matches.FileName

  $urlInstall64      = $downloadPage.links | Where-Object href -match $reInstall64 | Select-Object -expand href | ForEach-Object { $domain + $_ }
  $fileNameInstall64 = $Matches.FileName

  $urlPortable64      = $downloadPage.links | Where-Object href -match $rePortable | Select-Object -expand href | ForEach-Object { $domain + $_ }
  $fileNamePortable64 = $Matches.FileName

  $updateYear = (Get-Date).ToString('yyyy')
  $version    = $urlPortable64-match $reVersion | foreach-object { $Matches.Version }

  return @{
    UrlInstall32        = $urlInstall32
    FileNameInstall32   = $fileNameInstall32
    UrlInstall64        = $urlInstall64
    FileNameInstall64   = $fileNameInstall64
    UrlPortable64       = $urlPortable64
    FileNamePortable64  = $fileNamePortable64
    UpdateYear          = $updateYear
    Version             = $version
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none -NoCheckUrl -NoReadme
}
