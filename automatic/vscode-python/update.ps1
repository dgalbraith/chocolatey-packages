Import-Module au
Import-Module ..\..\scripts\vs-marketplace\VS-Marketplace.psd1

$extension = 'python'
$publisher = 'ms-python'

$reChecksum      = '(?<=Checksum:\s+)(?<Checksum>[^\s]*)'
$reCopyright     = '(?<=copyright>)(?<Copyright>.*)(?=<\/copyright>)'
$reVsCodeVersion = '(?<=Code\s)(?<Version>\d+([\.-]*\d*)*)'
$reVersion       = '(?<Version>\d+\.\d*\.\d*)'

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reCopyright)"     = "$($Latest.Copyright)"
      "$($reVsCodeVersion)" = "$($Latest.VSCodeVersion)"
    }

    ".\README.md" = @{
      "$($reVsCodeVersion)" = "$($Latest.VSCodeVersion)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt"      = @{
      "$($reVersion)"  = "$($Latest.Version)"
      "$($reChecksum)" = "$($Latest.Checksum32)"
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
