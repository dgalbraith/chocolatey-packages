
import-module chocolatey-au

Import-Module ..\..\scripts\chocolatey-helpers\Chocolatey-Helpers.psd1

$ErrorActionPreference = 'STOP'

$releases = 'https://docs.microsoft.com/en-us/sql/connect/jdbc/download-microsoft-jdbc-driver-for-sql-server'

$reVersion = '(?<Version>([\d]+\.[\d]+\.[\d]+\.[\d]+))'

function global:au_BeforeUpdate {
  $Latest.Downloads = @{}

  $localeMappings = @{
    'br'    = 'ptb'
    'de'    = 'deu'
    'en'    = 'enu'
    'es'    = 'esn'
    'fr'    = 'fra'
    'it'    = 'ita'
    'ja'    = 'jpn'
    'ko'    = 'kor'
    'ru'    = 'rus'
    'zh'    = 'chs'
    'zh-CN' = 'chs'
    'zh-TW' = 'cht'
  }

  foreach ($locale in $localeMappings.Keys) {
    $language = $localeMappings[$locale]
    $fileName = "$($Latest.FileName32)" -f $Latest.Version, $language
    $url32    = "$($Latest.BaseUrl32)/{0}/$fileName" -f $language

    $checkSum = Get-RemoteChecksum -Url $url32 -Algorithm $Latest.ChecksumType32
    $download = New-Object PSObject -Property @{ Url = $Url32; Checksum = $checkSum }
    
    $Latest.Downloads.Add($locale, $download)
  }
}

function global:au_SearchReplace {
  @{
    '.\README.md' = @{
      "$reVersion" = "$($Latest.Version)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      '(?<=\$base\s*=\s*'')(?<BaseUrl>([^'']+))'           = "$($Latest.BaseUrl32)"
      "(?<='br'.+Checksum\s*=\s*')(?<Checksum>([^']+))"    = "$($Latest.Downloads['br'].Checksum)"
      "(?<='de'.+Checksum\s*=\s*')(?<Checksum>([^']+))"    = "$($Latest.Downloads['de'].Checksum)"
      "(?<='en'.+Checksum\s*=\s*')(?<Checksum>([^']+))"    = "$($Latest.Downloads['en'].Checksum)"
      "(?<='es'.+Checksum\s*=\s*')(?<Checksum>([^']+))"    = "$($Latest.Downloads['es'].Checksum)"
      "(?<='fr'.+Checksum\s*=\s*')(?<Checksum>([^']+))"    = "$($Latest.Downloads['fr'].Checksum)"
      "(?<='it'.+Checksum\s*=\s*')(?<Checksum>([^']+))"    = "$($Latest.Downloads['it'].Checksum)"
      "(?<='ja'.+Checksum\s*=\s*')(?<Checksum>([^']+))"    = "$($Latest.Downloads['ja'].Checksum)"
      "(?<='ko'.+Checksum\s*=\s*')(?<Checksum>([^']+))"    = "$($Latest.Downloads['ko'].Checksum)"
      "(?<='ru'.+Checksum\s*=\s*')(?<Checksum>([^']+))"    = "$($Latest.Downloads['ru'].Checksum)"
      "(?<='zh'.+Checksum\s*=\s*')(?<Checksum>([^']+))"    = "$($Latest.Downloads['zh'].Checksum)"
      "(?<='zh-CN'.+Checksum\s*=\s*')(?<Checksum>([^']+))" = "$($Latest.Downloads['zh-CN'].Checksum)"
      "(?<='zh-TW'.+Checksum\s*=\s*')(?<Checksum>([^']+))" = "$($Latest.Downloads['zh-TW'].Checksum)"
    }
 
    ".\tools\chocolateyUninstall.ps1" = @{
      "$reVersion" = "$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $downloadUri = $downloadPage.Links | where-object { $_ -match 'Download Microsoft JDBC Driver.*zip' } | select-object -expand href

  $Url32      = Get-RedirectedUri -Uri $downloadUri
  $baseUrl32  = $url32 -replace '/[^/]+/[^/]+$', ''
  $fileName32 = $url32 -split '/'  -replace $reVersion, '{0}' -replace 'enu', '{1}' | select-object -last 1 
  $version    = $url32 -match $reVersion | foreach-object { $Matches.Version }

  return @{
    BaseUrl32      = $baseUrl32
    ChecksumType32 = 'sha256'
    FileName32     = $fileName32
    Version        = $version
  }
}

update -ChecksumFor none -NoReadme -NoCheckUrl
