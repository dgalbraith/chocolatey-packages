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
      "$($reVersion)" = "`${1}$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reVersion)"    = "$($Latest.Version)"
      "$($reChecksum32)" = "$($Latest.Checksum32)"
      "$($reChecksum32)" = "$($Latest.Checksum64)"
    }
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
