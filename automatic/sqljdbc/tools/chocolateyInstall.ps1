$ErrorActionPreference = 'Stop'

add-type @"
public struct Language {
   public string Name;
   public string Mapping;
   public string Checksum;
}
"@

$languageDefinitions =  @{
    'br'    = [Language] @{ Name = 'Brazilian (Portuguese)'; Mapping = 'ptb'; Checksum = 'f3cd0ca83cca7cf193acf29e3243f4658195a5a58346a1b23add56caa1900eb3' }
    'de'    = [Language] @{ Name = 'German';                 Mapping = 'deu'; Checksum = 'f346d3f57d80ecdaa31150af84d1e47f756b39346995d46defd36df96e50567e' }
    'en'    = [Language] @{ Name = 'English';                Mapping = 'enu'; Checksum = '1de08e567e0bc18cabc0f099bbe18571a5c4d405c828a4983f3268264dc4905f' }
    'es'    = [Language] @{ Name = 'Spanish';                Mapping = 'esn'; Checksum = '5b9dc4c1e1f6aa81f2530762a2b650b550e34e7929687d1a29b33720ae481e3b' }
    'fr'    = [Language] @{ Name = 'French';                 Mapping = 'fra'; Checksum = '98ff3e19ba8ffa9d65e0f74785bf852f255dc598f45749c0dfc0a00c5383f7bc' }
    'it'    = [Language] @{ Name = 'Italian';                Mapping = 'ita'; Checksum = '8573ee7cdb679404e4fdb8f258afa1c16e2ea62a21c6a98b708f41c40d7190d7' }
    'ja'    = [Language] @{ Name = 'Japanese';               Mapping = 'jpn'; Checksum = '627c9374373fc71cb8ba54723844440a2cac52cbc2e76991ff4bcb69421e12a4' }
    'ko'    = [Language] @{ Name = 'Korean';                 Mapping = 'kor'; Checksum = '107215e1e17edf4eb1237eea9d388d0ff43834a864db379189bb01cdcf6baca6' }
    'ru'    = [Language] @{ Name = 'Russian';                Mapping = 'rus'; Checksum = '7de525043f7703aacb40e38ac06a5558f567391b5e97c36260e5eaf6fbc5374b' }
    'zh'    = [Language] @{ Name = 'Chinese';                Mapping = 'chs'; Checksum = '520a6a92e6c4701a04d9bed2076d52cc34127dc53129374c40ae2ed65b8be368' }
    'zh-CN' = [Language] @{ Name = 'Chinese (Simplified)';   Mapping = 'chs'; Checksum = '520a6a92e6c4701a04d9bed2076d52cc34127dc53129374c40ae2ed65b8be368' }
    'zh-TW' = [Language] @{ Name = 'Chinese (Traditional)';  Mapping = 'cht'; Checksum = '77f229372970197807ab11f423ae02218df694487f3280265bb215853c6a9456' }
}

$base = 'https://download.microsoft.com/download/d/1/9/d194dc5c-4db6-4fb6-8ba2-219c93272b7b'

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
