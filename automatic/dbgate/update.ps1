import-module au

Import-Module ..\..\scripts\chocolatey-helpers\Chocolatey-Helpers.psd1

$ErrorActionPreference = 'STOP'

$domain     = 'https://github.com'
$user       = 'dbgate'
$repository = 'dbgate'

$reChecksum = '(?<=Checksum:\s*)((?<Checksum>([^\s].+)))'
$reInstall  = "(?<=\d\/|\s|')(?<FileName64Install>(dbgate-\d\.\d\.\d-win_x64\.exe))"
$rePortable = "(?<=\d\/|\s|')(?<FileName64Portable>(dbgate-\d\.\d\.\d-win_x64\.zip))"
$reVersion  = '(?<=v|\[)(?<Version>([\d]+\.[\d]+\.[\d]+\.?[\d]*))'

function global:au_BeforeUpdate {
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Get-GitHubLatestReleasePage -User $user -Repository $repository

  $url64Install      = $downloadPage.links | Where-Object href -match $reInstall | Select-Object -first 1 -expand href | ForEach-Object { $domain + $_ }
  $fileName64Install = $Matches.FileName64Install

  $url64Portable      = $downloadPage.links | Where-Object href -match $rePortable | Select-Object -first 1 -expand href | ForEach-Object { $domain + $_ }
  $fileName64Portable = $Matches.FileName64Portable

  $version = $url64Portable -match $reVersion | ForEach-Object { $Matches.Version }

  return @{
    Url64Install       = $url64Install
    FileName64Install  = $fileName64Install
    Url64Portable      = $url64Portable
    FileName64Portable = $fileName64Portable
    Version            = $version
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none -NoCheckUrl -NoReadme
}
