$ErrorActionPreference = 'Stop'

add-type @"
public struct Language {
   public string Name;
   public string Mapping;
   public string Checksum;
}
"@

$languageDefinitions =  @{
    'br'    = [Language] @{ Name = 'Brazilian (Portuguese)'; Mapping = 'ptb'; Checksum = '63fcfc1302398549cd34afa22271915b452511f42da96f1a568528e24733d93f' }
    'de'    = [Language] @{ Name = 'German';                 Mapping = 'deu'; Checksum = '882e170fac702102f20e34d7b8149672145446794e285650c7c46dbe5a746b6a' }
    'en'    = [Language] @{ Name = 'English';                Mapping = 'enu'; Checksum = '6d0e7681db71a680f98134a45a8ecf57e8b0c61c1f99bcf3e464fd6814e0feef' }
    'es'    = [Language] @{ Name = 'Spanish';                Mapping = 'esn'; Checksum = '0b9e222bc1624c815f80f8e5de3aa9e5ef4f7d05dda2931e5bdc8d5fe7985db8' }
    'fr'    = [Language] @{ Name = 'French';                 Mapping = 'fra'; Checksum = 'd9fb9e6ff29f39c731acaeb65f290da00ca73c90eae728b7b09d967057051f33' }
    'it'    = [Language] @{ Name = 'Italian';                Mapping = 'ita'; Checksum = '663353269a32fc7db8765c6dcef0b6fadf29ab3b2a8c7053d736e7620585bb09' }
    'ja'    = [Language] @{ Name = 'Japanese';               Mapping = 'jpn'; Checksum = 'd61e712dacfc83ff37a0672ac8d845b538f5e2e36d896f9a57e85a7cb47a28b3' }
    'ko'    = [Language] @{ Name = 'Korean';                 Mapping = 'kor'; Checksum = '690432de16b1e92291ef15358c7d293d8befff42729f9405f11a7f2fd3d6af32' }
    'ru'    = [Language] @{ Name = 'Russian';                Mapping = 'rus'; Checksum = '39ce7dd662a173d682dcdf219fa997518968e36634a05cea9651f19e573ad5da' }
    'zh'    = [Language] @{ Name = 'Chinese';                Mapping = 'chs'; Checksum = 'b9dd3a6f80ebadcb883d9df5713e6c62141cee19d10171174324773b2d444ebe' }
    'zh-CN' = [Language] @{ Name = 'Chinese (Simplified)';   Mapping = 'chs'; Checksum = 'b9dd3a6f80ebadcb883d9df5713e6c62141cee19d10171174324773b2d444ebe' }
    'zh-TW' = [Language] @{ Name = 'Chinese (Traditional)';  Mapping = 'cht'; Checksum = 'c5ae19f35cb39548335599df2b4bd75c1580ffab7c7fea7fd79143fcce0dac07' }
}

$base = 'https://download.microsoft.com/download/a/9/1/a91534b0-ed8c-4501-b491-e1dd0a20335a'

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
