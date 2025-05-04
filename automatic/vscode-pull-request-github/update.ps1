import-module chocolatey-au
Import-Module ..\..\scripts\vs-marketplace\VS-Marketplace.psd1

$ErrorActionPreference = 'Stop'

$extension = 'vscode-pull-request-github'
$publisher = 'GitHub'

$reChecksum      = '(?<=Checksum:\s*)((?<Checksum>([^\s]+)))'
$reCopyright     = '(?<=(Copyright.+(?<CopyrightFrom>[\d]{4})-))(?<CopyrightTo>[\d]{4})'
$reFileName      = '(?<=\\|\s)(?<FileName>GitHub.+\.vsix)'
$reVersion       = '(?<=\/)(?<Version>([\d]+\.[\d]+\.[\d]+\.?[\d]*))'
$reVSCodeVersion = '(?<=(Visual Studio Code ))(?<Version>[0-9]+\.[0-9]+\.[0-9]+\.?[\d]*)(?=( or newer))'

function global:au_BeforeUpdate {
  mkdir tools -ea 0 | Out-Null
  $toolsPath = Resolve-Path tools

  Remove-Item -Force "$toolsPath\*.$Latest.FileType" -ea ignore

  $outputFile = "{0}\{1}.{2}" -f $toolsPath, $Latest.FilenameBase, $Latest.FileType
  Invoke-WebRequest -uri $Latest.Url32 -OutFile $outputFile

  $global:Latest.Checksum32 = Get-FileHash $outputFile -Algorithm $Latest.ChecksumType32 | ForEach-Object Hash
  $global:Latest.FileName32 = $outputFile
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reCopyright)" = "$($Latest.UpdateYear)"
      "$($reVSCodeVersion)" = "$($Latest.VSCodeVersion)"
    }

    ".\README.md" = @{
      "$($reVSCodeVersion)" = "$($Latest.VSCodeVersion)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "$($reFileName)" = "$($Latest.FileName32)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reChecksum)" = "$($Latest.Checksum32)"
      "$($reFileName)" = "$($Latest.FileName32)"
      "$($reVersion)"  = "$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $extensionInfo = Get-VSMarketplaceExtensionDetails -Extension $extension -Publisher $publisher

  @{
    Version        = $extensionInfo.Version
    VSCodeVersion  = $extensionInfo.VSCodeVersion
    URL32          = $extensionInfo.DownloadUrl
    FileNameBase   = $extensionInfo.Filename -match '(?<Filename>(.*))(.vsix)' | ForEach-Object { $Matches['Filename'] }
    UpdateYear     = $extensionInfo.UpdateYear
    FileType       = 'vsix'
    ChecksumType32 = 'sha256'
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
