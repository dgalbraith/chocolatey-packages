import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/mongodb/mongocli/releases/latest"

$reChecksum = '(?<=Checksum:\s*)((?<Checksum>([^\s].+)))'
$reInstall  = "(?<=\d\/|\s|')(?<Filename>(m.+w.+msi))"
$rePortable = "(?<=\d\/|\s|')(?<Filename>(m.+w.+zip))"
$reVersion  = '(?<=v|\[)(?<Version>([\d]+\.[\d]+\.[\d]+\.?[\d]*))'

function global:au_BeforeUpdate {
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url64Install = $downloadPage.links | where-object href -match $reInstall | select-object -expand href | foreach-object { $domain + $_ }
  $fileName64Install = $url64Install -split '/' | select-object -last 1

  $url64Portable = $downloadPage.links | where-object href -match $rePortable | select-object -expand href | foreach-object { $domain + $_ }
  $fileName64Portable = $url64Portable -split '/' | select-object -last 1

  $version = $url64Portable -match $reversion | foreach-object { $Matches.Version }

  return @{
    Url64Install       = $url64Install
    FileName64Install  = $fileName64Install
    Url64Portable      = $url64Portable
    FileName64Portable = $fileName64Portable
    Version            = $version
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none -NoCheckUrl -NoReadme
}
