. $PSScriptRoot\..\naps2\update.ps1

$ErrorActionPreference = 'STOP'

function global:au_BeforeUpdate {
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
      "$($reChecksum)" = "$($Latest.Checksum64)"
      "$($reInstall64)"  = "$($Latest.FileName64)"
      "$($reVersion)"    = "$($Latest.Version)"
    }

    ".\tools\ChocolateyInstall.ps1" = @{
      "$($reInstall64)" = "$($Latest.FileName64)"
    }
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
