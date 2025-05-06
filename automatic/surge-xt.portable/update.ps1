. $PSScriptRoot\..\surge-xt\update.ps1

$ErrorActionPreference = 'STOP'

function global:au_BeforeUpdate {
  $Latest.Checksum64 = Get-RemoteChecksum -Url $Latest.UrlPortable64 -ChecksumType 'sha256'
  $Latest.FileName64 = $Latest.FileNamePortable64
  $Latest.Url64      = $Latest.UrlPortable64
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reCopyright)" = "$($Latest.UpdateYear)"
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($reChecksum64)" = "$($Latest.Checksum64)"
      "$($rePortable)"   = "$($Latest.FileName64)"
      "$($reVersion)"    = "$($Latest.Version)"
    }

  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
