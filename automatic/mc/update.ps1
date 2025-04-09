import-module au

Import-Module ..\..\scripts\chocolatey-helpers\Chocolatey-Helpers.psd1

$ErrorActionPreference = 'STOP'

$domain     = 'https://github.com'
$user       = 'adamyg'
$repository = 'mcwin32'


$re32           = '(?<Filename32>(mcwin32-build\d{3}-setup.exe))'
$re64           = '(?<Filename64>(mcwin32-build\d{3}-x64-setup.exe))'
$reVersion      = '(?<Version>(?<Major>\d*)\.(?<Minor>\d*)\.(?<Patch>\d*)\.(?<Build>\d{3}))'
$reShortVersion = '(?<=\s)(?<Version>(?<Major>\d*)\.(?<Minor>\d*)\.(?<Patch>\d*))'

$reChecksum32 = '(?<=Checksum32:\s*)(?<Checksum32>[^\s].+)'
$reChecksum64 = '(?<=Checksum64:\s*)(?<Checksum64>[^\s].+)'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$reShortVersion" = "$($Latest.ShortVersion)"
    }
    ".\README.md" = @{
      "$reVersion"      = "$($Latest.Version)"
      "$reShortVersion" = "$($Latest.ShortVersion)"
    }
    ".\legal\VERIFICATION.txt" = @{
      "$re32"         = "$($Latest.FileName32)"
      "$reChecksum32" = "$($Latest.Checksum32)"
      "$re64"         = "$($Latest.FileName64)"
      "$reChecksum64" = "$($Latest.Checksum64)"
      "$reVersion"    = "$($Latest.Version)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "$re32" = "$($Latest.FileName32)"
      "$re64" = "$($Latest.FileName64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Get-GitHubLatestReleasePage -User $user -Repository $repository

  $url32      = $downloadPage.links | where-object href -match $re32 | select-object -expand href | foreach-object { $domain + $_ }
  $fileName32 = $url32 -split '/' | select-object -last 1

  $url64      = $downloadPage.links | where-object href -match $re64 | select-object -expand href | foreach-object { $domain + $_ }
  $fileName64 = $url64 -split '/' | select-object -last 1
  $version    = $url64 -match $reVersion | foreach-object { $Matches.Version }

  return @{
    Url32        = $url32
    FileName32   = $fileName32
    Url64        = $url64
    FileName64   = $fileName64
    Version      = $version
    ShortVersion = $version -replace '\.[^\.]+$', ''
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
