. $PSScriptRoot\..\ipnetinfo.install\update.ps1

$ErrorActionPreference = 'STOP'

function global:au_BeforeUpdate {
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reversion)" = "`${1}$($Latest.Version)"
    }
    "$($Latest.PackageName).nuspec" = @{
      "$($reversion)" = "`${1}$($Latest.Version)"
    }
  }
}

update -ChecksumFor none -NoReadme
