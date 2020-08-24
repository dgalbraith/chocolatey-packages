. $PSScriptRoot\..\pictus\update.ps1

$ErrorActionPreference = 'STOP'

function global:au_BeforeUpdate {
  $Latest.File32   = "$($Latest.FileNameInstall)"
  $Latest.Url32    = "$($Latest.UrlInstall)"
  $Latest.FileType = 'exe'
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reversion)" = "`${1}$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reversion)"      = "`${1}$($Latest.Version)"
      "(Checksum:\s*)(.+)" = "`${1}$($Latest.Checksum32)"
    }
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
