. $PSScriptRoot\..\beekeeper-studio\update.ps1

$ErrorActionPreference = 'STOP'

function global:au_BeforeUpdate {
  $Latest.FileName64 = "$($Latest.FileNamePortable)"
  $Latest.Url64      = "$($Latest.UrlPortable)"

  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "`${1}$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($rePortable)"       = "$($Latest.FileName64)"
      "$($reVersion)"        = "`${1}$($Latest.Version)"
      "(Checksum64:\s*)(.+)" = "`${1}$($Latest.Checksum64)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "($rePortable)" = "$($Latest.FileName64)"
    }
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
