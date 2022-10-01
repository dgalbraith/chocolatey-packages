import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/mongodb-js/mongosh/releases/latest"

$re64       =  '(mongosh-.+win32-x64\.zip)' # despite the filename the archive contains a 64-bit executable
$reChecksum = '(?<=Checksum:\s*)((?<Checksum>([^\s].+)))'
$reVersion  = '(?<=v)(?<Version>([\d]+\.[\d]+\.[\d]+))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reVersion)" = "`${1}$($Latest.Version)"
    }

    ".\README.md" = @{
      "$($reVersion)" = "`${1}$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($re64)"       = "$($Latest.Filename64)"
      "$($reVersion)"  = "$($Latest.Version)"
      "$($reChecksum)" = "$($Latest.Checksum64)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "$($re64)" = "$($Latest.Filename64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases
  $latestTag    = $downloadPage.BaseResponse.ResponseUri -split '\/' | Select-Object -Last 1
  $assetsUri    = "{0}/expanded_assets/{1}" -f ($releases.Substring(0, $releases.LastIndexOf('/'))), $latestTag
  $assetsPage   = Invoke-WebRequest -UseBasicParsing -Uri $assetsUri

  $url64      = $assetsPage.links | where-object href -match "$re64$" | select-object -expand href | foreach-object { $domain + $_ }
  $filename64 = $url64 -split '/' | select-object -last 1

  $version = $url64 -match $reversion | foreach-object { $Matches.Version }

  return @{
    FileType   = 'zip'
    FileName64 = $filename64
    Url64      = $url64
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
