$ErrorActionPreference = 'Stop'

add-type @"
public struct Language {
   public string Name;
   public string Mapping;
   public string Checksum;
}
"@

$languageDefinitions =  @{
    'br'    = [Language] @{ Name = 'Brazilian (Portuguese)'; Mapping = 'ptb'; Checksum = 'f0c89de24dcea117e1ce3731704f8c770ca51ec637fd685d868a93ffabae8b4f' }
    'de'    = [Language] @{ Name = 'German';                 Mapping = 'deu'; Checksum = 'a535010f1296dc66c58f33305b2a2694523510f6c2d065aeb4921d204d250ca6' }
    'en'    = [Language] @{ Name = 'English';                Mapping = 'enu'; Checksum = 'e52f48a298f1e27d5e77830ffd275216e59985850f27cc2bab050f7c01b03348' }
    'es'    = [Language] @{ Name = 'Spanish';                Mapping = 'esn'; Checksum = 'fbbbf722b44cfdd4178f4c968f6935a0281ec1252dd8cb0b9bfbf9ea68c3e5c3' }
    'fr'    = [Language] @{ Name = 'French';                 Mapping = 'fra'; Checksum = '355d06aade1731bc40f4e43b40358b449404adb92f6550df3e78472d52c276c6' }
    'it'    = [Language] @{ Name = 'Italian';                Mapping = 'ita'; Checksum = 'db958cac8c446053b2b52a651aabf891d4fb15d31e85923d4b8c208b11693875' }
    'ja'    = [Language] @{ Name = 'Japanese';               Mapping = 'jpn'; Checksum = 'c713539dbd58d6d2ae0c9be0c866f1557ed2ae447a82851ed4e3716fc8036f66' }
    'ko'    = [Language] @{ Name = 'Korean';                 Mapping = 'kor'; Checksum = '6fdf60b4a8857d36d6cade04b6bd0d12621c82c5c6586701a9e30b8fbdc3763c' }
    'ru'    = [Language] @{ Name = 'Russian';                Mapping = 'rus'; Checksum = '54c04852c7687993a8e7eab9a10d0570553f6c2ff9de58208cafae1040d5012d' }
    'zh'    = [Language] @{ Name = 'Chinese';                Mapping = 'chs'; Checksum = 'ea9031e273cdd53070a59302ce5426a6f9251b24838967c28bf869a5f8f407e8' }
    'zh-CN' = [Language] @{ Name = 'Chinese (Simplified)';   Mapping = 'chs'; Checksum = 'ea9031e273cdd53070a59302ce5426a6f9251b24838967c28bf869a5f8f407e8' }
    'zh-TW' = [Language] @{ Name = 'Chinese (Traditional)';  Mapping = 'cht'; Checksum = '71cee264de4a5c8118f93d1ef001a25dbbfd5dfdeb669ff894bec5056e95ed16' }
}

$base = 'https://download.microsoft.com/download/4/d/5/4d5a79be-35f8-48d4-a984-473747362f99'

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
