$ErrorActionPreference = 'Stop'

add-type @"
public struct Language {
   public string Name;
   public string Mapping;
   public string Checksum;
}
"@

$languageDefinitions =  @{
    'br'    = [Language] @{ Name = 'Brazilian (Portuguese)'; Mapping = 'ptb'; Checksum = 'B01BB14599BC9222B98BFC937BE4C87EDEA8ECCC3AA7D09B5800F26E38C503BB' }
    'de'    = [Language] @{ Name = 'German';                 Mapping = 'deu'; Checksum = '369154D14A483531722D490550C4CBC2944E6C7153840AD55E0E2B3D1B269F62' }
    'en'    = [Language] @{ Name = 'English';                Mapping = 'enu'; Checksum = 'EDCC5E277289BA0B526F6DC9F732087DAC004DE54C64E95F9049F68218662EE6' }
    'es'    = [Language] @{ Name = 'Spanish';                Mapping = 'esn'; Checksum = 'F7BE52C654CE9207AB2904BBC745FC62B9787E02E35C09B7CF459E10D9D65F59' }
    'fr'    = [Language] @{ Name = 'French';                 Mapping = 'fra'; Checksum = '4711573DC4E54B18928221AF9DD0F9927B741B026A742968BD4CF5AF428CD137' }
    'it'    = [Language] @{ Name = 'Italian';                Mapping = 'ita'; Checksum = '8F95B4B6063383360F4FBE818E276F04D5866FBB60E7B3BD0A7970B8D9387B6C' }
    'ja'    = [Language] @{ Name = 'Japanese';               Mapping = 'jpn'; Checksum = '0DE8342018EA328434E5A26217E64F042AAC0F892EAA1AD9EC009563E52C9623' }
    'ko'    = [Language] @{ Name = 'Korean';                 Mapping = 'kor'; Checksum = '67D7D947562D72D9484DB9D6A831EEB91157DF8699418FC8FDAF64DB606E641C' }
    'ru'    = [Language] @{ Name = 'Russian';                Mapping = 'rus'; Checksum = '417144F34DBBDA8FFA18219B3BB6CD94A28F1095211E8B161F3E3122E8EB9FAC' }
    'zh'    = [Language] @{ Name = 'Chinese';                Mapping = 'chs'; Checksum = '0C60DFE98BFD37F3D3E1F6F5AFC4A40365E5A8BCBA491B8E73BE67C9A78B98E4' }
    'zh-CN' = [Language] @{ Name = 'Chinese (Simplified)';   Mapping = 'chs'; Checksum = '0C60DFE98BFD37F3D3E1F6F5AFC4A40365E5A8BCBA491B8E73BE67C9A78B98E4' }
    'zh-TW' = [Language] @{ Name = 'Chinese (Traditional)';  Mapping = 'cht'; Checksum = 'CE04122DBEDA8B88C690F666368ADAE6D73669E1196450819F5D1633BD1AC48F' }
}

$base = 'https://download.microsoft.com/download/4/c/3/4c31fbc1-62cc-4a0b-932a-b38ca31cabcd'

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
