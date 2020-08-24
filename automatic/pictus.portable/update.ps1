. $PSScriptRoot\..\pictus\update.ps1

$ErrorActionPreference = 'STOP'

function global:au_BeforeUpdate {
  $Latest.File32 = $Lstest.FileNamePortable32
  $Latest.Url32  = $Latest.UrlPortable32
  $Latest.File64 = $Lstest.FileNamePortable64
  $Latest.Url64  = $Latest.UrlPortable64
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reversion)" = "`${1}$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reversion)"        = "`${1}$($Latest.Version)"
      "(Checksum32:\s*)(.+)" = "`${1}$($Latest.Checksum32)"
      "(Checksum64:\s*)(.+)" = "`${1}$($Latest.Checksum64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases
  $urls = $downloadPage.links | where-object href -match 'Pict.{4}\.[exe|zip]' | select-object -expand href | foreach-object { $domain + $_ }

  $urlInstall      = $urls -match '.*exe' | Select-Object -First 1
  $fileNameInstall = $urlInstall -split '/' | Select-Object -Last 1

  $urlPortable32      = $urls -match '.*32\.zip' | Select-Object -First 1
  $fileNamePortable32 = $urlPortable32 -split '/' | Select-Object -Last 1

  $urlPortable64      = $urls -match '.*64\.zip' | Select-Object -First 1
  $fileNamePortable64 = $urlPortable64 -split '/' | Select-Object -Last 1

  $urlInstall -match $reversion
  $version = $matches.Version

  return @{
    UrlInstall         = $urlInstall
    FileNameInstall    = $fileNameInstall
    UrlPortable32      = $urlPortable32
    FileNamePortable32 = $fileNamePortable32
    UrlPortable64      = $urlPortable64
    FileNamePortable64 = $fileNamePortable64
    Version            = $version
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
