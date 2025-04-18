import-module au

$ErrorActionPreference = 'STOP'

$domain     = 'https://github.com'
$user       = 'cyanfish'
$repository = 'naps2'

$reChecksum   = '(?<=Checksum:\s*)(?<Checksum>[^\s]+)'
$reCopyright  = '(?<=(Copyright.+(?<CopyrightFrom>[\d]{4})-))(?<CopyrightTo>[\d]{4})'
$rePortable   = "(?<=\d\/|\s|')(?<Filename>n.+zip)"
$reInstall64  = "(?<=\d\/|\s|')(?<Filename>n.+x64\.msi)"
$reVersion    = '(?<=v|\[)(?<Version>[\d]+\.[\d]+\.[\d]+\.?[\d]*)'

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

  $url64      = $downloadPage.links | Where-Object href -match $reInstall64 | Select-Object -first 1 -expand href | ForEach-Object { $domain + $_ }
  $fileName64 = $Matches.FileName

  $urlPortable      = $downloadPage.links | Where-Object href -match $rePortable | Select-Object -expand href | ForEach-Object { $domain + $_ }
  $fileNamePortable = $Matches.FileName

  $updateYear = (Get-Date).ToString('yyyy')
  $version    = $urlPortable -match $reVersion | foreach-object { $Matches.Version }

  return @{
    Url64             = $url64
    FileName64        = $fileName64
    UrlPortable       = $urlPortable
    FileNamePortable  = $fileNamePortable
    UpdateYear        = $updateYear
    Version           = $version
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none -NoCheckUrl -NoReadme
}
