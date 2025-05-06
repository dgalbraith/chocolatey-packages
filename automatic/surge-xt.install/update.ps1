. $PSScriptRoot\..\surge-xt\update.ps1

$ErrorActionPreference = 'STOP'

function global:au_BeforeUpdate {
  $Latest.Checksum32 = Get-RemoteChecksum -Url $Latest.UrlInstall32 -ChecksumType 'sha256'
  $Latest.FileName32 = $Latest.FileNameInstall32
  $Latest.FileName64 = $Latest.FileNameInstall64
  $Latest.Url64      = $Latest.UrlInstall64

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
      "$($reChecksum64)" = "$($Latest.Checksum64)"
      "$($reInstall64)"  = "$($Latest.FileName64)"
      "$($reVersion)"    = "$($Latest.Version)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($reChecksum32)" = "$($Latest.Checksum32)"
      "$($reInstall32)"  = "$($Latest.FileName32)"
      "$($reInstall64)"  = "$($Latest.FileName64)"
      "$($reVersion)"    = "$($Latest.Version)"
    }
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
