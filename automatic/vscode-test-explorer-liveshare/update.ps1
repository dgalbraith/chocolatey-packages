import-module chocolatey-au
Import-Module ..\..\scripts\vs-marketplace\VS-Marketplace.psd1

$ErrorActionPreference = 'Stop'

$extension = 'vscode-test-explorer-liveshare'
$publisher = 'hbenl'

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "(copyright>)(.*)(<\/copyright>)"                          = "`${1}$($Latest.Copyright)`${3}"
      "(Visual Studio Code )([0-9]+\.[0-9]+\.[0-9]+)( or newer)" = "`${1}$($Latest.VSCodeVersion)`${3}"
    }

    ".\README.md" = @{
      "(Visual Studio Code )([0-9]+\.[0-9]+\.[0-9]+)( or newer)" = "`${1}$($Latest.VSCodeVersion)`${3}"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "([0-9]+\.[0-9]+\.[0-9]+)" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt"      = @{
      "([0-9]+\.[0-9]+\.[0-9]+)" = "$($Latest.Version)"
      "(Checksum:\s*)(.*)"       = "`${1}$($Latest.Checksum32)"
    }
  }
}

function global:au_BeforeUpdate {
  mkdir tools -ea 0 | Out-Null
  $toolsPath = Resolve-Path tools

  Remove-Item -Force "$toolsPath\*.$Latest.FileType" -ea ignore

  $outputFile = "{0}\{1}.{2}" -f $toolsPath, $Latest.FilenameBase, $Latest.FileType
  Invoke-WebRequest -uri $Latest.Url32 -OutFile $outputFile

  $global:Latest.Checksum32 = Get-FileHash $outputFile -Algorithm $Latest.ChecksumType32 | ForEach-Object Hash
  $global:Latest.FileName32 = $outputFile
}

function global:au_GetLatest {
  Write-Host('Running GetLatest')
  $extensionInfo = Get-VSMarketplaceExtensionDetails -Extension $extension -Publisher $publisher

  @{
    Copyright      = $extensionInfo.Copyright -replace "\s<.*>",""
    Version        = $extensionInfo.Version
    VSCodeVersion  = $extensionInfo.VSCodeVersion
    URL32          = $extensionInfo.DownloadUrl
    FileNameBase   = $extensionInfo.Filename -match '(?<Filename>(.*))(.vsix)' | ForEach-Object { $Matches['Filename'] }
    FileType       = 'vsix'
    ChecksumType32 = 'sha256'
  }
}

update -ChecksumFor none -NoReadme
