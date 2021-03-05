import-module au

$ErrorActionPreference = 'STOP'

$releases = 'https://bluemaxima.org/flashpoint/downloads/'

$reCoreUrl     = 'F.+Core.+\.7z$'
$reCoreVersion = '>F.+Core\s(?<Version>(\d+\.\d+))<'
$reVersion     = '(?<Version>(\d+\.\d+))'

function global:au_BeforeUpdate {
  $Latest.Checksum = Get-RemoteChecksum $Latest.Url
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      '(http.*\.7z)'            = "$($Latest.Url)"
      "(Checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum)'"
    }

    ".\tools\chocolateyUninstall.ps1" = @{
      '(Fl.+\.7z)' = "$($Latest.Archive)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $urlCore = $downloadPage.links | where-object href -match $reCoreUrl | select-object -expand href | foreach-object { $releases + $_ }
  $archive = ($urlCore.split('/') | select-object -last 1) -replace '%20',' '
  $version = $downloadPage.Content -match $reCoreVersion | foreach-object { $Matches.Version }

  return @{
    Archive = $archive
    Url     = $urlCore
    Version = $version
  }
}

update -ChecksumFor none -NoReadme
