$ErrorActionPreference = 'Stop'

add-type @"
public struct Language {
   public string Name;
   public string Mapping;
   public string Checksum;
}
"@

$languageDefinitions =  @{
    'br'    = [Language] @{ Name = 'Brazilian (Portuguese)'; Mapping = 'ptb'; Checksum = '51feae722d68a22124db2c7426f4cd9b46865468e3aff7f76d0dbfed443c72ee' }
    'de'    = [Language] @{ Name = 'German';                 Mapping = 'deu'; Checksum = 'a40643dd3d35274674af7419dc574aca37938279dc11206520d6c10cb530ef7b' }
    'en'    = [Language] @{ Name = 'English';                Mapping = 'enu'; Checksum = 'ee4bc95077374845c645a4ed6bf0249b966410ee4ed9a39f365a1d9df2174548' }
    'es'    = [Language] @{ Name = 'Spanish';                Mapping = 'esn'; Checksum = '5c7f643b327fa619aed2ca1e777e59202c5f6dbeb508e9b24bd439db4f383b54' }
    'fr'    = [Language] @{ Name = 'French';                 Mapping = 'fra'; Checksum = '5a1031a4e1a44e3c80cfabd53de1a7caa974a1811a3a4ffd79d7657cd4086f20' }
    'it'    = [Language] @{ Name = 'Italian';                Mapping = 'ita'; Checksum = '5df68d30f2b59b0192db57b1ce8ed3faddde8173430db6aee45c13a8bb42b237' }
    'ja'    = [Language] @{ Name = 'Japanese';               Mapping = 'jpn'; Checksum = '9371623ecae373744ee735e75fe16f4c9262311b29a13acd17b6f76a497370d5' }
    'ko'    = [Language] @{ Name = 'Korean';                 Mapping = 'kor'; Checksum = 'f1461e3bd42ccfbbd8920190171467fcf1b2917b16582c5a54a956a98c5e7ecd' }
    'ru'    = [Language] @{ Name = 'Russian';                Mapping = 'rus'; Checksum = 'e064990af72894252a2442af305ddac4c63858eb45768c9518f5d4859cbbdd5b' }
    'zh'    = [Language] @{ Name = 'Chinese';                Mapping = 'chs'; Checksum = '023bfa8d332c3a96fd1cb3945ec0e92c8a73b1ab5e3f38aba17eb3e14a1d8ee5' }
    'zh-CN' = [Language] @{ Name = 'Chinese (Simplified)';   Mapping = 'chs'; Checksum = '023bfa8d332c3a96fd1cb3945ec0e92c8a73b1ab5e3f38aba17eb3e14a1d8ee5' }
    'zh-TW' = [Language] @{ Name = 'Chinese (Traditional)';  Mapping = 'cht'; Checksum = 'd4ebb72064532cf9a83fa1b752e7d20938046b9004e7814ac73fcf9c23a741f1' }
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
