import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/poppeman/Pictus/releases/latest"

$reChecksum   = '(?<=Checksum:\s*)((?<Checksum>([^\s].+)))'
$reChecksum32 = '(?<=Checksum32:\s*)((?<Checksum>([^\s].+)))'
$reChecksum64 = '(?<=Checksum64:\s*)((?<Checksum>([^\s].+)))'
$reVersion    = '(?<=\/v|\[|-)(?<Version>([\d]+\.[\d]+\.[\d]+))'

function global:au_BeforeUpdate {
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    "$($Latest.PackageName).nuspec" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases
  $latestTag    = $downloadPage.BaseResponse.ResponseUri -split '\/' | Select-Object -Last 1
  $assetsUri    = "{0}/expanded_assets/{1}" -f ($releases.Substring(0, $releases.LastIndexOf('/'))), $latestTag
  $assetsPage   = Invoke-WebRequest -UseBasicParsing -Uri $assetsUri

  $urls = $assetsPage.links | where-object href -match 'Pict.{4}\.[exe|zip]' | select-object -expand href | foreach-object { $domain + $_ }

  $urlInstall      = $urls -match '.*exe' | Select-Object -First 1
  $fileNameInstall = $urlInstall -split '/' | Select-Object -Last 1

  $urlPortable32      = $urls -match '.*32\.zip' | Select-Object -First 1
  $fileNamePortable32 = $urlPortable32 -split '/' | Select-Object -Last 1

  $urlPortable64      = $urls -match '.*64\.zip' | Select-Object -First 1
  $fileNamePortable64 = $urlPortable64 -split '/' | Select-Object -Last 1

  $version = $UrlInstall -Match $reVersion | ForEach-Object { $Matches.Version }

  return @{
    UrlInstall         = $urlInstall
    FileNameInstall    = $fileNameInstall
    UrlPortable32      = $urlPortable32
    FileNamePortable32 = $fileNamePortable32
    UrlPortable64      = $urlPortable64
    FileNamePortable64 = $fileNamePortable64
    Version            = $version
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none -NoCheckUrl -NoReadme
}
