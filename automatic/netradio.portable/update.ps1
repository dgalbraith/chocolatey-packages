. $PSScriptRoot\..\netradio\update.ps1

$ErrorActionPreference = 'STOP'

function global:au_BeforeUpdate {
  $Latest.Url64 = 'https://www.ophthalmostar.de/NetRadio.zip'

  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reChecksum64)" = "$($Latest.Checksum64)"
    }
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
