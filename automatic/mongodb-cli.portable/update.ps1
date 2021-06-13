. $PSScriptRoot\..\mongodb-cli\update.ps1

$ErrorActionPreference = 'STOP'

function global:au_BeforeUpdate {
  $Lagest.FileName64 = "$($Latest.FileName64Portable)"
  $Latest.Url64      = "$($Latest.Url64Portable)"
  
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reShortVersion)" = "$($Latest.ShortVersion)"
    }

    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reChecksum)" = "$($Latest.Checksum64)"
      "$($reInstall)"  = "$($Latest.FileName64)"
      "$($reVersion)"  = "$($Latest.Version)"
    }
  }
}

update -ChecksumFor none -NoReadme
