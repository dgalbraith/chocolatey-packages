$ErrorActionPreference = 'Stop'

add-type @"
public struct Language {
   public string Name;
   public string Mapping;
   public string Checksum;
}
"@

$languageDefinitions =  @{
    'br'    = [Language] @{ Name = 'Brazilian (Portuguese)'; Mapping = 'ptb'; Checksum = '4eee335e8e8da993a0cca04a432e0dc2c407172382dcb9da98fe2a7ca776a1b6' }
    'de'    = [Language] @{ Name = 'German';                 Mapping = 'deu'; Checksum = 'c7a421e584fa7c63325dcad5a56133a1dad39c47ba752a23378afb22b73bab59' }
    'en'    = [Language] @{ Name = 'English';                Mapping = 'enu'; Checksum = 'd6866b9ff8586f953c462a27ecd208c9d6978570e7022dc7aab957f5cc70a5a8' }
    'es'    = [Language] @{ Name = 'Spanish';                Mapping = 'esn'; Checksum = 'de1a9b81cb700b87b4725fbe4ab6bc82cb602567cb664c76b735bf46f4af82af' }
    'fr'    = [Language] @{ Name = 'French';                 Mapping = 'fra'; Checksum = '4872d7e0f393db76515873456638200eb15026a51ff62089e1eb10a410821fc8' }
    'it'    = [Language] @{ Name = 'Italian';                Mapping = 'ita'; Checksum = '5bca4a9d3ae2fe83fb835dece2be0f0416afd8408d4787cca2b0efbc62020998' }
    'ja'    = [Language] @{ Name = 'Japanese';               Mapping = 'jpn'; Checksum = '4f4db6f721080c52d2a3698475bf806c4be8ae9b51b5cc0e8ca28054c88c1fd0' }
    'ko'    = [Language] @{ Name = 'Korean';                 Mapping = 'kor'; Checksum = 'e85e6ed3e4c876f128d393fa39750e74665126d04bb5d36f64f718cad86a15d0' }
    'ru'    = [Language] @{ Name = 'Russian';                Mapping = 'rus'; Checksum = 'ac21d5cdd8129ea87568cd7f2fff78597e363812f36ce29f883ceb888ce3debd' }
    'zh'    = [Language] @{ Name = 'Chinese';                Mapping = 'chs'; Checksum = 'fc4eaad08e65d0e0fc4228fc849a07fb04359662701dcf8e71788b83dd5eaf86' }
    'zh-CN' = [Language] @{ Name = 'Chinese (Simplified)';   Mapping = 'chs'; Checksum = 'fc4eaad08e65d0e0fc4228fc849a07fb04359662701dcf8e71788b83dd5eaf86' }
    'zh-TW' = [Language] @{ Name = 'Chinese (Traditional)';  Mapping = 'cht'; Checksum = '25089b474c281a762b1b2b68f092caee141df0edf5a59de257ee44949c72af1a' }
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
