$ErrorActionPreference = 'Stop'

add-type @"
public struct Language {
   public string Name;
   public string Mapping;
   public string Checksum;
}
"@

$languageDefinitions =  @{
    'br'    = [Language] @{ Name = 'Brazilian (Portuguese)'; Mapping = 'ptb'; Checksum = 'b01bb14599bc9222b98bfc937be4c87edea8eccc3aa7d09b5800f26e38c503bb' }
    'de'    = [Language] @{ Name = 'German';                 Mapping = 'deu'; Checksum = '369154d14a483531722d490550c4cbc2944e6c7153840ad55e0e2b3d1b269f62' }
    'en'    = [Language] @{ Name = 'English';                Mapping = 'enu'; Checksum = 'edcc5e277289ba0b526f6dc9f732087dac004de54c64e95f9049f68218662ee6' }
    'es'    = [Language] @{ Name = 'Spanish';                Mapping = 'esn'; Checksum = 'f7be52c654ce9207ab2904bbc745fc62b9787e02e35c09b7cf459e10d9d65f59' }
    'fr'    = [Language] @{ Name = 'French';                 Mapping = 'fra'; Checksum = '4711573dc4e54b18928221af9dd0f9927b741b026a742968bd4cf5af428cd137' }
    'it'    = [Language] @{ Name = 'Italian';                Mapping = 'ita'; Checksum = '8f95b4b6063383360f4fbe818e276f04d5866fbb60e7b3bd0a7970b8d9387b6c' }
    'ja'    = [Language] @{ Name = 'Japanese';               Mapping = 'jpn'; Checksum = '0de8342018ea328434e5a26217e64f042aac0f892eaa1ad9ec009563e52c9623' }
    'ko'    = [Language] @{ Name = 'Korean';                 Mapping = 'kor'; Checksum = '67d7d947562d72d9484db9d6a831eeb91157df8699418fc8fdaf64db606e641c' }
    'ru'    = [Language] @{ Name = 'Russian';                Mapping = 'rus'; Checksum = '417144f34dbbda8ffa18219b3bb6cd94a28f1095211e8b161f3e3122e8eb9fac' }
    'zh'    = [Language] @{ Name = 'Chinese';                Mapping = 'chs'; Checksum = '0c60dfe98bfd37f3d3e1f6f5afc4a40365e5a8bcba491b8e73be67c9a78b98e4' }
    'zh-CN' = [Language] @{ Name = 'Chinese (Simplified)';   Mapping = 'chs'; Checksum = '0c60dfe98bfd37f3d3e1f6f5afc4a40365e5a8bcba491b8e73be67c9a78b98e4' }
    'zh-TW' = [Language] @{ Name = 'Chinese (Traditional)';  Mapping = 'cht'; Checksum = 'ce04122dbeda8b88c690f666368adae6d73669e1196450819f5d1633bd1ac48f' }
}

$base = 'https://download.microsoft.com/download/4/c/3/4c31fbc1-62cc-4a0b-932a-b38ca31cd410'

$pp = Get-PackageParameters

if ($pp.InstallDir) {
    $installDir = $pp.InstallDir
} else {
    if ($pp.User) {
        $programs = [Environment]::GetFolderPath('LocalApplicationData')
    } else {
        $programs = [Environment]::GetFolderPath('ProgramFiles')
    }

    $installDir = Join-Path $programs 'Microsoft JDBC DRIVER for SQL Server'
}

# check the languages parameter and default to 'en' if not supplied
$languages = $pp['Languages']

if ($null -eq $languages -or $languages -eq '') {
  $languages = 'en'
}

$reLang = “(?i)^(br|de|en|es|fr|it|ja|ko|ru|zh|zh-CN|zh-TW)$”

foreach ($language in $languages -split ',') {
  if ($language -notmatch $reLang) {
    Write-Error "Unsupported language $($language)"
  }
  
  $fileName = 'sqljdbc_{0}_{1}.zip' -f $Env:PackageVersion, $languageDefinitions[$language].Mapping

  $packageArgs = @{
    PackageName   = $env:ChocolateyPackageName
    UnzipLocation = $installDir
    Url           = "${base}/${fileName}"
    Checksum      = $languageDefinitions[$language].Checksum
    ChecksumType  = 'sha256'
  }
  
  Install-ChocolateyZipPackage @packageArgs  
}
