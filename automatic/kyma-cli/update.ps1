import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/kyma-project/cli/releases/latest"

$re32         = 'i386\.zip'
$re64         = 'x86_64\.zip'
$reChecksum32 = '(?<=Checksum32:\s*)((?<Checksum>([^\s].+)))'
$reChecksum64 = '(?<=Checksum64:\s*)((?<Checksum>([^\s].+)))'
$reUrl        = '(kyma_Windows_(i386|x86_64).+zip)'
$reVersion    = '(?<Version>([\d]+\.[\d]+\.[\d]+(\.[\d]+)?))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reVersion)"    = "$($Latest.Version)"
      "$($reChecksum32)" = "$($Latest.Checksum32)"
      "$($reChecksum64)" = "$($Latest.Checksum64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases
  $latestTag    = $downloadPage.BaseResponse.ResponseUri -split '\/' | Select-Object -Last 1
  $assetsUri    = "{0}/expanded_assets/{1}" -f ($releases.Substring(0, $releases.LastIndexOf('/'))), $latestTag
  $assetsPage   = Invoke-WebRequest -UseBasicParsing -Uri $assetsUri

  $urls = $assetsPage.links | where-object href -match $reurl | select-object -expand href | foreach-object { $domain + $_ }

  $url32 = $urls -match $re32 | select-object -first 1
  $filename32 = $url32 -split '/' | select-object -last 1

  $url64 = $urls -match $re64 | select-object -first 1
  $filename64 = $url36 -split '/' | select-object -last 1

  $version = $url64 -Match $reVersion | ForEach-Object { $Matches.Version }

  return @{
    FileType   = 'zip'
    FileName32 = $filename32
    Url32      = $url32
    FileName64 = $filename64
    Url64      = $url64
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
