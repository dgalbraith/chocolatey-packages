$ErrorActionPreference = 'Stop'

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

if ($env:ChocolateyForceX86 -eq 'true' -and (Get-ProcessorBits 64) -eq 'true') {
  Write-Error "32-bit install not supported on a 64-bit machine"
}

if ((Get-ProcessorBits 32) -eq 'true') {
  $architecture = 'x86'
} elseif ((Get-ProcessorBits 64) -eq 'true') {
  $architecture = 'x64'
} else {
  Write-Error 'Unsupported CPU architecture'
}

class Language {
    [string]$Code
    [string]$Name
    [string]$mapping
}

$languages =  @{
    'br'    = [Language] @{ Code='br';    Name = 'Brazil (Portuguese)';   Mapping = 'PTB' }
    'cz'    = [Language] @{ Code='cz';    Name = 'Czech';                 Mapping = 'CSY' }
    'de'    = [Language] @{ Code='de';    Name = 'German';                Mapping = 'DEU' }
    'en'    = [Language] @{ Code='en';    Name = 'English';               Mapping = 'ENU' }
    'es'    = [Language] @{ Code='es';    Name = 'Spanish';               Mapping = 'ESN' }
    'fr'    = [Language] @{ Code='fr';    Name = 'French';                Mapping = 'FRA' }
    'it'    = [Language] @{ Code='it';    Name = 'Italian';               Mapping = 'ITA' }
    'ja'    = [Language] @{ Code='ja';    Name = 'Japanese';              Mapping = 'JPN' }
    'ko'    = [Language] @{ Code='ko';    Name = 'Korean';                Mapping = 'KOR' }
    'pl'    = [Language] @{ Code='pl';    Name = 'Polish';                Mapping = 'PLK' }
    'ru'    = [Language] @{ Code='ru';    Name = 'Russian';               Mapping = 'RUS' }
    'tr'    = [Language] @{ Code='tr';    Name = 'Turkish';               Mapping = 'TRK' }
    'zh'    = [Language] @{ Code='zh';    Name = 'Chinese';               Mapping = 'CHS' }
    'zh-CN' = [Language] @{ Code='zh-CN'; Name = 'Chinese (Simplified)';  Mapping = 'CHS' }
    'zh-TW' = [Language] @{ Code='zh-TW'; Name = 'Chinese (Traditional)'; Mapping = 'CHT' }
}

$pp = Get-PackageParameters

# check the language parameter and default to 'en' if not supplied
$language = $pp['Language']

if ($null -eq $language -or $language -eq '') {
  $language = 'en'
}

$relang = “(?i)^(br|cz|de|en|es|fr|it|ja|ko|pl|ru|tr|zh|zh-CN|zh-TW)$”

if ($language -notmatch $relang) {
  Write-Error "Unsupported language $($pp.Language)"
}

$mapping = $languages[$language].Mapping

# construct the filename and extract the relevant installer to a temp directory
$fileName = "{0}\SSCERuntime_{1}-{2}.exe" -f $toolsDir, $architecture, $mapping

$tempDir = Join-Path ([System.IO.Path]::GetTempPath()) ([System.IO.Path]::GetRandomFileName())
if (![System.IO.Directory]::Exists($tempDir)) { [System.IO.Directory]::CreateDirectory($tempDir) | Out-Null }

Start-Process "$fileName" -ArgumentList "/X:$tempDir /q" -Wait

$fileName = "{0}\SSCERuntime_{1}-{2}.msi" -f $tempDir, $architecture, $mapping

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileType       = 'msi'
  File           = $fileName
  SilentArgs     = '/quiet /qn /norestart'
  ValidExitCodes = @(0, 1641, 3010)
}

Install-ChocolateyInstallPackage @packageArgs

$files = Get-ChildItem $toolsDir -include *.exe -recurse

foreach ($file in $files) {
  Remove-Item $file.ignore -Type file -Force -ErrorAction Ignore | Out-Null
}

Remove-Item -Path $tempDir -Recurse -Force -ErrorAction Ignore | Out-Null
