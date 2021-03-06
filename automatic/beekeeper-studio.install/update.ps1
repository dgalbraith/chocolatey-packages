﻿. $PSScriptRoot\..\beekeeper-studio\update.ps1

$ErrorActionPreference = 'STOP'

function global:au_BeforeUpdate {
  $Latest.FileName64 = "$($Latest.FileNameInstall)"
  $Latest.Url64      = "$($Latest.UrlInstall)"

  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "`${1}$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reInstall)"        = "$($Latest.FileName64)"
      "$($reVersion)"        = "`${1}$($Latest.Version)"
      "(Checksum64:\s*)(.+)" = "`${1}$($Latest.Checksum64)"
    }
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
