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
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reVersion)"  = "$($Latest.Version)"
      "$($reChecksum)" = "$($Latest.Checksum32)"
    }
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
