. $PSScriptRoot\..\dbgate\update.ps1

$ErrorActionPreference = 'STOP'

function global:au_BeforeUpdate {
  $Latest.Url64      = "$($Latest.Url64Install)"
  $Latest.FileName64 = "$($Latest.FileName64Install)"
  $Latest.FileType   = 'exe'
  
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

    ".\tools\chocolateyInstall.ps1" = @{
      "$($reInstall)" = "$($Latest.FileName64)"
    }
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
