$ErrorActionPreference = 'Stop'

add-type @"
public struct Language {
   public string Name;
   public string Mapping;
   public string Checksum;
}
"@

$languageDefinitions =  @{
    'br'    = [Language] @{ Name = 'Brazilian (Portuguese)'; Mapping = 'ptb'; Checksum = '8efec16932fab1b8e1fbe13331942a1002aa7347003d5cc4e1d0c5787235ac73' }
    'de'    = [Language] @{ Name = 'German';                 Mapping = 'deu'; Checksum = 'dcfb04b235b1748bd07676826c7f289ffd302e0895813fb000832a1c8c6b05c9' }
    'en'    = [Language] @{ Name = 'English';                Mapping = 'enu'; Checksum = 'd83569e7d5110a7b603218979395b09de6f011c3f9813a562a7247bbe13f8562' }
    'es'    = [Language] @{ Name = 'Spanish';                Mapping = 'esn'; Checksum = '69b0ac2357fd09909fbee4dc321dc5cd873fb277373bf82209f67a20581903c7' }
    'fr'    = [Language] @{ Name = 'French';                 Mapping = 'fra'; Checksum = '44f9c40f4b01cef40a364d5dc7f6e77fa82de10de7d247c723cf0aa563be62f1' }
    'it'    = [Language] @{ Name = 'Italian';                Mapping = 'ita'; Checksum = '1ea73349d55ffe05b29350b8c51020ecf8bc7ba6fb02c265c2cbffe76de8b972' }
    'ja'    = [Language] @{ Name = 'Japanese';               Mapping = 'jpn'; Checksum = '6d26f86bc348ea1700d312b3e498cbffbd0c5c9131004227d3d52d7d22973b8e' }
    'ko'    = [Language] @{ Name = 'Korean';                 Mapping = 'kor'; Checksum = '9035ca477950ca6776850150ad5fdd8cee33e759ed8abee3969bfc42a79e102b' }
    'ru'    = [Language] @{ Name = 'Russian';                Mapping = 'rus'; Checksum = '22d2eb877bec15df24bcede49fdea9397ce4a387a9d9f2da9be0e2aff8d1696e' }
    'zh'    = [Language] @{ Name = 'Chinese';                Mapping = 'chs'; Checksum = '521b8c97de505f7765efb1cb4cee5c4068058c1829c66085c42229cd38f3a78d' }
    'zh-CN' = [Language] @{ Name = 'Chinese (Simplified)';   Mapping = 'chs'; Checksum = '521b8c97de505f7765efb1cb4cee5c4068058c1829c66085c42229cd38f3a78d' }
    'zh-TW' = [Language] @{ Name = 'Chinese (Traditional)';  Mapping = 'cht'; Checksum = '9679fe4e77ff493a05e8ad06483b491131ef274c857c60692703f4528cf5a9aa' }
}

$base = 'https://download.microsoft.com/download/b/c/5/bc5e407f-97ff-42ea-959d-12f2391063d7'

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
