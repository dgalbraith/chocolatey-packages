Import-Module au

Import-Module ..\..\scripts\chocolatey-helpers\Chocolatey-Helpers.psd1

$ErrorActionPreference = 'STOP'

$domain     = 'https://github.com'
$user       = 'Levminer'
$repository = 'authme'

$reChecksum = '(?<=Checksum:\s*)((?<Checksum>([^\s].+)))'
$reInstall  = "(?<=\d\/|\s|')(?<Filename>(authme.+windows-x64\.msi))"
$rePortable = "(?<=\d\/|\s|')(?<Filename>(authme.+windows-x64\.zip))"
$reVersion  = '(?<=v|\[|\/|-)(?<Version>([\d]+\.[\d]+\.[\d]+\.?[\d]*))'

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

  $url64Install      = $downloadPage.links | where-object href -match $reInstall | select-object -expand href | foreach-object { $domain + $_ }
  $fileName64Install = $url64Install -split '/' | select-object -last 1

  $url64Portable      = $downloadPage.links | where-object href -match $rePortable | select-object -expand href | foreach-object { $domain + $_ }
  $fileName64Portable = $url64Portable -split '/' | select-object -last 1

  $version = $url64Portable -match $reVersion | foreach-object { $Matches.Version }

  return @{
    Url64Install       = $url64Install
    FileName64Install  = $fileName64Install
    Url64Portable      = $url64Portable
    FileName64Portable = $fileName64Portable
    Version            = $version
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none -NoReadme -NoCheckUrl
}
