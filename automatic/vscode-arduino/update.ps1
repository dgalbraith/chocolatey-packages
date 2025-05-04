import-module chocolatey-au

Import-Module ..\..\scripts\vs-marketplace\VS-Marketplace.psd1

$ErrorActionPreference = 'STOP'

$extension = 'vscode-arduino-community'
$publisher = 'vscode-arduino'

$reChecksum  = '(?<=Checksum:\s+)(?<Checksum>[^\s]*)'
$reCopyright = '(?<=\<copyright\>).+(?=\<\/copyright\>)'
$reFileName  = '(?<Filename>(.*))(.vsix)'
$reVersion   = '(?<=\s|-)(?<Version>[0-9]+\.[0-9]+\.[0-9]+)'

#/vscode-arduino/vscode-arduino/releases/download/v0.7.1/vscode-arduino-win32-x64.vsix

function global:au_BeforeUpdate {
  mkdir tools -ea 0 | Out-Null
  $toolsPath = Resolve-Path tools

  Remove-Item -Force "$toolsPath\*.$Latest.FileType" -ea ignore | Out-Null

  $outputFile = "{0}\{1}.{2}" -f $toolsPath, $Latest.FilenameBase, $Latest.FileType
  Invoke-WebRequest -uri $Latest.Url32 -OutFile $outputFile

  $global:Latest.Checksum32 = Get-FileHash $outputFile -Algorithm $Latest.ChecksumType32 | ForEach-Object Hash
  $global:Latest.FileName32 = $outputFile
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$reVersion"   = "$($Latest.VSCodeVersion)"
      "$reCopyright" = "$($Latest.Copyright)"
    }

    ".\README.md" = @{
      "$reVersion" = "$($Latest.VSCodeVersion)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$reVersion" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$reVersion"  = "$($Latest.Version)"
      "$reChecksum" = "$($Latest.Checksum32)"
    }
  }
}

function global:au_GetLatest {
  $extensionInfo = Get-VSMarketplaceExtensionDetails -Extension $extension -Publisher $publisher

  @{
    Version        = $extensionInfo.Version
    VSCodeVersion  = $extensionInfo.VSCodeVersion
    URL32          = $extensionInfo.DownloadUrl
    FileNameBase   = $extensionInfo.Filename -match $reFileName | ForEach-Object { $Matches['Filename'] }
    FileType       = 'vsix'
    ChecksumType32 = 'sha256'
    Copyright      = $extensionInfo.Copyright
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
