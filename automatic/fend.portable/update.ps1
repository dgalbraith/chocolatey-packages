. $PSScriptRoot\..\fend\update.ps1

$ErrorActionPreference = 'STOP'

function global:au_BeforeUpdate {
  $Latest.FileName64 = "$($Latest.FileNamePortable)"
  $Latest.Url64      = "$($Latest.UrlPortable)"
  $Latest.FileType   = 'zip'

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
      "$($rePortable)" = "$($Latest.FileNamePortable)"
      "$($reVersion)"  = "$($Latest.Version)"
    }

    ".\tools\chocolateyBeforeModify.ps1" = @{
      "$($rePortable)" = "$($Latest.FileNamePortable)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($rePortable)" = "$($Latest.FileNamePortable)"
    }
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
