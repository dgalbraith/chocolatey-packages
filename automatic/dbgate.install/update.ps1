. $PSScriptRoot\..\dbgate\update.ps1

$ErrorActionPreference = 'STOP'

function global:au_BeforeUpdate {
  $Latest.FileName64 = "$($Latest.FileName64Install)"
  $Latest.Url64      = "$($Latest.Url64Install)"

  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reChecksum)" = "$($Latest.Checksum64)"
      "$($reInstall)"  = "$($Latest.FileName64)"
      "$($reVersion)"  = "$($Latest.Version)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "$($reInstall)" = "$($Latest.FileName64)"
    }
  }
}

update -ChecksumFor none -NoReadme
