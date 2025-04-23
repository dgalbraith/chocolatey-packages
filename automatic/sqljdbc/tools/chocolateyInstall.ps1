$ErrorActionPreference = 'Stop'

add-type @"
public struct Language {
   public string Name;
   public string Mapping;
   public string Checksum;
}
"@

$languageDefinitions =  @{
    'br'    = [Language] @{ Name = 'Brazilian (Portuguese)'; Mapping = 'ptb'; Checksum = 'c1f8c502c09b8cba24b199a4b8e63446796baabaedd07654b0ea4d5f1a3eee5f' }
    'de'    = [Language] @{ Name = 'German';                 Mapping = 'deu'; Checksum = 'b4b79a74acfffe6695afdee652ed0df1e1a4710fcbca4c18bb3665b5549c9b96' }
    'en'    = [Language] @{ Name = 'English';                Mapping = 'enu'; Checksum = 'c8a0fbfa69b20e48fb01b91d6cf4dd790c3017df1aa5355d8ff534b360ccbbf9' }
    'es'    = [Language] @{ Name = 'Spanish';                Mapping = 'esn'; Checksum = '28c055908ae7436e70ed3ce06dad3aa8b1985f56836aaf7afa645687f562c5eb' }
    'fr'    = [Language] @{ Name = 'French';                 Mapping = 'fra'; Checksum = '9bac6f88f7ebb372b9a40d45dedde2fbcb962738e5b23b4616dc23695d7f38d8' }
    'it'    = [Language] @{ Name = 'Italian';                Mapping = 'ita'; Checksum = '9ea4ccdcad59b8e4df10d1e12c2912817e4b67868c41b93712b59f3bf5934e63' }
    'ja'    = [Language] @{ Name = 'Japanese';               Mapping = 'jpn'; Checksum = '71b8c737e455a2f02519059ed6e1985d1c3ecbfc62fecab92c7a96b5256d2272' }
    'ko'    = [Language] @{ Name = 'Korean';                 Mapping = 'kor'; Checksum = 'ef217793951afef6c0e7a401e51a3ae8afdf29886d6460983db4d011617febdb' }
    'ru'    = [Language] @{ Name = 'Russian';                Mapping = 'rus'; Checksum = 'c9e44ac3b87555323a9406160b20a028fe32f7d93178ff106d70473cf49a2c20' }
    'zh'    = [Language] @{ Name = 'Chinese';                Mapping = 'chs'; Checksum = '1a386aa5a007932eab3d2c187c16715b052ac8f6179e74378d20f54327b728fd' }
    'zh-CN' = [Language] @{ Name = 'Chinese (Simplified)';   Mapping = 'chs'; Checksum = '1a386aa5a007932eab3d2c187c16715b052ac8f6179e74378d20f54327b728fd' }
    'zh-TW' = [Language] @{ Name = 'Chinese (Traditional)';  Mapping = 'cht'; Checksum = '59464887c3e91421fe74e43fc6e07e5e3588ff36a094c81bbf34555b7a564857' }
}

$base = 'https://download.microsoft.com/download/745da347-bd51-4bf0-a84e-3465608d8856'

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

$version = $Env:PackageVersion

# check for a three-part version and append a tr4ailing zero if needed
if ($version -match '^\d+\.\d+\.\d+$') {
  $version = $version + '.0'
}

foreach ($language in $languages -split ',') {
  if ($language -notmatch $reLang) {
    Write-Error "Unsupported language $($language)"
  }
  
  $language = $languageDefinitions[$language].Mapping
  $fileName = 'sqljdbc_{0}_{1}.zip' -f $version, $language
  $url      =  "$base/$language/$fileName"

  $packageArgs = @{
    PackageName   = $env:ChocolateyPackageName
    UnzipLocation = $installDir
    Url           = $url
    Checksum      = $languageDefinitions[$language].Checksum
    ChecksumType  = 'sha256'
  }
  
  Install-ChocolateyZipPackage @packageArgs  
}
