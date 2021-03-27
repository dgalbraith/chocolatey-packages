. $PSScriptRoot\..\beekeeper-studio\update.ps1

$ErrorActionPreference = 'STOP'

function global:au_BeforeUpdate {
  $Latest.FileName64 = "$($Latest.FileNameInstall)"
  $Latest.Url64      = "$($Latest.UrlInstall)"

  Write-Host($Latest.FileName64)

  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "`${1}$($Latest.Version)"
    }

    "$($Latest.PackageName).nuspec" = @{
      "$($reVersion)" = "`${1}$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reInstall)"        = "$($Latest.FileName64)"
      "$($reVersion)"        = "`${1}$($Latest.Version)"
      "(Checksum64:\s*)(.+)" = "`${1}$($Latest.Checksum64)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "($reInstall)" = "$($Latest.FileName64)"
    }
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
