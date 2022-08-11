$ErrorActionPreference = 'Stop'

add-type @"
public struct Language {
   public string Name;
   public string Mapping;
   public string Checksum;
}
"@

$languageDefinitions =  @{
    'br'    = [Language] @{ Name = 'Brazilian (Portuguese)'; Mapping = 'ptb'; Checksum = '07082162fa8dc89ce89c6a046b3a4cba908a5dacf130470d258bcb648113fe08' }
    'de'    = [Language] @{ Name = 'German';                 Mapping = 'deu'; Checksum = '046309a94baad6a942c6b8235aabf7aa0357baee5f7ec490b5e4ce4d2da8064b' }
    'en'    = [Language] @{ Name = 'English';                Mapping = 'enu'; Checksum = 'd87979856f1d7e753cbb873e534d2e02e2040df03e9f90592ad7a0b3ae630af0' }
    'es'    = [Language] @{ Name = 'Spanish';                Mapping = 'esn'; Checksum = '0ff7d15a86d16c86edab6160e45f7f1811de27e11e2acdafae2825c0940c91d7' }
    'fr'    = [Language] @{ Name = 'French';                 Mapping = 'fra'; Checksum = '95b46d8202f0dc2a9fdce46583e78df514eaaa97f7f4e60081d9f9963eac5c88' }
    'it'    = [Language] @{ Name = 'Italian';                Mapping = 'ita'; Checksum = 'e513435933381244db94d0c3743b64b0536f22898797ddd5a21ff3d3b7e3c6c6' }
    'ja'    = [Language] @{ Name = 'Japanese';               Mapping = 'jpn'; Checksum = '84f8b69a52063ec4fbc2fd93b1626fa6ed52257ecf5af1ad44d28b4ea246c486' }
    'ko'    = [Language] @{ Name = 'Korean';                 Mapping = 'kor'; Checksum = '01d2f3bd606eda964f67608b87c534012762bb83ad25f8ce12c231f556d384c5' }
    'ru'    = [Language] @{ Name = 'Russian';                Mapping = 'rus'; Checksum = '5f3af78d9398727ee210329f03371d4b3bded0334dea777008b39ce0b33c93a6' }
    'zh'    = [Language] @{ Name = 'Chinese';                Mapping = 'chs'; Checksum = '48642dc6e9ae0ae6799ee726e8d36406c01a1a82a257ace13cd105bae848b3cc' }
    'zh-CN' = [Language] @{ Name = 'Chinese (Simplified)';   Mapping = 'chs'; Checksum = '48642dc6e9ae0ae6799ee726e8d36406c01a1a82a257ace13cd105bae848b3cc' }
    'zh-TW' = [Language] @{ Name = 'Chinese (Traditional)';  Mapping = 'cht'; Checksum = '0a408576e4fe392863c1ec1ad635bc8a48b8af2aed3fe45ad13be65d9eb8ae44' }
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
