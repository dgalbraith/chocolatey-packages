Import-Module au
Import-Module ..\..\scripts\vs-marketplace\VS-Marketplace.psd1

$extension = 'vscode-maven'
$publisher = 'vscjava'

$reChecksum      = '(?<=Checksum:\s*)((?<Checksum>([^\s].+)))'
$reCopyright     = '(?<=(<copyright>)).+(?=\<)'
$reFileName32    = '(?<=\\|\s)(?<FileName>vscjava.+\.vsix)'
$reVersion       = '(?<=\/)(?<Version>([\d]+\.[\d]+\.[\d]+\.?[\d]*))'
$reVSCodeVersion = '(?<=(Visual Studio Code ))(?<Version>[0-9]+\.[0-9]+\.[0-9]+\.?[\d]*)(?=( or newer))'

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reCopyright)"     = "$($Latest.Copyright)"
      "$($reVSCodeVersion)" = "$($Latest.VSCodeVersion)"
    }

    ".\README.md" = @{
      "$($reVSCodeVersion)" = "$($Latest.VSCodeVersion)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "$($reFileName32)" = "$($Latest.FileNameBase)"
    }

    ".\legal\VERIFICATION.txt"      = @{
      "$($reVersion)"    = "$($Latest.Version)"
      "$($reFileName32)" = "$($Latest.FileNameBase)"
      "$($reChecksum)"   = "$($Latest.Checksum32)"
    }
  }
}
function global:au_BeforeUpdate {
  mkdir tools -ea 0 | Out-Null
  $toolsPath = Resolve-Path tools

  Write-Host 'Purging ' $Latest.FileType
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
    Copyright      = $extensionInfo.Copyright
    Version        = $extensionInfo.Version
    VSCodeVersion  = $extensionInfo.VSCodeVersion
    URL32          = $extensionInfo.DownloadUrl
    FileNameBase   = $extensionInfo.Filename -match '(?<Filename>(.*))(.vsix)' | ForEach-Object { $Matches['Filename'] }
    FileType       = 'vsix'
    ChecksumType32 = 'sha256'
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
