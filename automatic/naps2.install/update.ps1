. $PSScriptRoot\..\naps2\update.ps1

$ErrorActionPreference = 'STOP'

function global:au_BeforeUpdate {
  $Latest.FileName32 = "$($Latest.FileNameInstall32)"
  $Latest.Url32      = "$($Latest.UrlInstall32)"
  $Latest.FileName64 = "$($Latest.FileNameInstall64)"
  $Latest.Url64      = "$($Latest.UrlInstall64)"

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
      "$($reChecksum32)" = "$($Latest.Checksum32)"
      "$($reInstall32)"  = "$($Latest.FileName32)"
      "$($reChecksum64)" = "$($Latest.Checksum64)"
      "$($reInstall64)"  = "$($Latest.FileName64)"
      "$($reVersion)"    = "$($Latest.Version)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "$($reInstall32)" = "$($Latest.FileName32)"
      "$($reInstall64)" = "$($Latest.FileName64)"
    }
  }
}

update -ChecksumFor none -NoReadme -NoCheckUrl
