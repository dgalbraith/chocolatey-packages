import-module chocolatey-au

$ErrorActionPreference = 'STOP'


$releases = 'https://www.simplestickynotes.com/download'

$reChecksum  = '(?<=Checksum:[\s]*)(?<Checksum>[^\s]+)'
$reCopyright = '(?<=Copyright.+)(?<CopyrightYear>[\d]{4})'
$reVersion   = '(?<=Version\s|v)(?<Version>\d\.\d(?:\.\d)?)'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix -Algorithm $Latest.ChecksumType32
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
        "$($reCopyright)" = "$($Latest.UpdateYear)"
    }

    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
        "$($reChecksum)" = "$($Latest.Checksum32)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $updateYear = (Get-Date).ToString('yyyy')
  $version    = $downloadPage.Content -match $reVersion | foreach-object { $Matches.Version }

  return @{
    Url32          = 'https://www.simplestickynotes.com/setup/Setup_SimpleStickyNotes.exe'
    FileName32     = 'Setup_SimpleStickyNotes.exe'
    ChecksumType32 = 'sha256'
    UpdateYear     = $updateYear
    Version        = $version
  }

}

update -ChecksumFor none -NoReadme
