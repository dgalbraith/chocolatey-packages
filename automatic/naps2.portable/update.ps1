. $PSScriptRoot\..\naps2\update.ps1

$ErrorActionPreference = 'STOP'

function global:au_BeforeUpdate {
  $Latest.FileName32 = "$($Latest.FileNamePortable)"
  $Latest.FileType   = 'zip'
  $Latest.Url32      = "$($Latest.UrlPortable)"

  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reCopyright)" = "$($Latest.UpdateYear)"
      "$($reVersion)"   = "$($Latest.Version)"
    }

    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reChecksum)" = "$($Latest.Checksum32)"
      "$($rePortable)" = "$($Latest.FileName32)"
      "$($reVersion)"  = "$($Latest.Version)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "$($rePortable)" = "$($Latest.FileName32)"
    }
  }
}

update -ChecksumFor none -NoReadme -NoCheckUrl
