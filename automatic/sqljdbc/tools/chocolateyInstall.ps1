$ErrorActionPreference = 'Stop'

add-type @"
public struct Language {
   public string Name;
   public string Mapping;
   public string Checksum;
}
"@

$languageDefinitions =  @{
    'br'    = [Language] @{ Name = 'Brazilian (Portuguese)'; Mapping = 'ptb'; Checksum = 'e2a03e701accd8b5c3ee54e45aedfa88b01c2bf013702aef799180b143e0f70f' }
    'de'    = [Language] @{ Name = 'German';                 Mapping = 'deu'; Checksum = '5f0b929fd7597672625ac13c089103261babed684b97b0287c0134a7034a83a8' }
    'en'    = [Language] @{ Name = 'English';                Mapping = 'enu'; Checksum = 'c4e366fdf187551415f6d884a5c1bc8b83d1f155002d17173820b54dceb96382' }
    'es'    = [Language] @{ Name = 'Spanish';                Mapping = 'esn'; Checksum = 'a7ab2b9a753a7999fa7dfdd406c6f3fcf6931a61a2d0c3368ccb56a81e3c5670' }
    'fr'    = [Language] @{ Name = 'French';                 Mapping = 'fra'; Checksum = '622b57fdead3e59496ecbc89d5e8845e17769c55d88f9180386f6851faa88830' }
    'it'    = [Language] @{ Name = 'Italian';                Mapping = 'ita'; Checksum = '2c0b6b4d7678b40e3404b129e40d301648e7c7d6d4dbf33621c97b14518749fa' }
    'ja'    = [Language] @{ Name = 'Japanese';               Mapping = 'jpn'; Checksum = '7cdcdf9e5d6cac6da57c7661ebe24964459743ebff19215383f4e0d16088b87f' }
    'ko'    = [Language] @{ Name = 'Korean';                 Mapping = 'kor'; Checksum = '1eaf732d7646a1a7f349327344a409ad26ecf01671fd1402cdf08ed04ad208b1' }
    'ru'    = [Language] @{ Name = 'Russian';                Mapping = 'rus'; Checksum = '67c76711ad51d5fa2bc6a9af6c41eb5f458866dcf0b9892ec9c276921ed65a14' }
    'zh'    = [Language] @{ Name = 'Chinese';                Mapping = 'chs'; Checksum = 'd3dee1c4e9c561bdf05092c6e07122e8e69dbdbbe0bccad81d9b94e8190ae7e3' }
    'zh-CN' = [Language] @{ Name = 'Chinese (Simplified)';   Mapping = 'chs'; Checksum = 'd3dee1c4e9c561bdf05092c6e07122e8e69dbdbbe0bccad81d9b94e8190ae7e3' }
    'zh-TW' = [Language] @{ Name = 'Chinese (Traditional)';  Mapping = 'cht'; Checksum = 'e5a9dcd29143edc3356d1516f37e715825bb75c3409a0758964c655bad89e665' }
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
