import-module chocolatey-au

$releases = 'https://developer.android.com/studio'

$reChecksum   = "(?<=checksum\s*=\s*')(?<Checksum>[^']+)"
$reCopyright  = '(?<=(Copyright.+(?<CopyrightFrom>[\d]{4})-))(?<CopyrightTo>[\d]{4})'
$reExecutable = '\.exe$'
$reUrl        = "(?<=[$]url\s*=\s*')(?<Url>[^']*)"
$reVersion    = '(?<=v|\[)(?<Version>\d+\.\d+\.\d+\.\d+)'

function global:au_BeforeUpdate {
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}
function global:au_SearchReplace {
    @{
      "$($Latest.PackageName).nuspec" = @{
        "$($reCopyright)" = "$($Latest.UpdateYear)"
      }

      ".\README.md" = @{
        "$($reVersion)" = "$($Latest.Version)"
      }

      ".\tools\chocolateyinstall.ps1" = @{
        "$($reUrl)"      = "$($Latest.Url64)"
        "$($reChecksum)" = "$($Latest.Checksum64)"
      }
    }
}

function global:au_GetLatest {
    $downloadPage = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $url      = $downloadPage.links | Where-Object href -match $reExecutable | Select-Object -expand href
    $filename = $url -split '/' | Select-Object -Last 1

    $updateYear = (Get-Date).ToString('yyyy')
    $version   = $url -split '-' | Select-Object -Last 1 -Skip 1

    return @{
      Url64      = $url
      FileName64 = $fileName
      UpdateYear = $updateYear
      Version    = $version
    }
}

update -ChecksumFor none -NoReadme
