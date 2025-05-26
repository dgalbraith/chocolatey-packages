$ErrorActionPreference = 'Stop'

$silentArgs = '/S'

$installParams = @{
  InstallationType = 'AllUsers'
  KeepPkgCache     = '0'
  NoRegistry       = '0'
  NoScripts        = '1'
  NoShortcuts      = '0'
  RegisterPython   = '0'
}

$pp = Get-PackageParameters

if ($pp.count -gt 0) {
  $pp.GetEnumerator() | ForEach-Object {
    switch ($_.name.ToLowerInvariant()) {
      'keeppackagecache' {
        $installParams['KeepPkgCache'] = '1'
      }
      'noregistry' {
        $installParams['NoRegistry'] = '1'
      }
      'noshortcuts' {
        $installParams['NoShortcuts'] = '1'
      }
      'registerpython' {
        $installParams['RegisterPython'] = '1'
      }
      'user' {
        $installParams['InstallationType'] = 'JustMe'
      }
      Default {
        Write-Verbose("Unknown parameter $_ will be ignored")
      }
    }
  }
}

# append package arguments to the silent arguments
$silentArgs += ($installParams.GetEnumerator() | ForEach-Object { " /$($_.name)=$($_.value)" }) -join ' '

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/spyder-ide/spyder/releases/download/v6.0.7/Spyder-Windows-x86_64.exe'
  checksum64     = '40c4bab88e3913d59a9fa3c6ac49816c336df1421cbe99605513b91cb7b46063'
  checksumType64 = 'sha256'
  fileType       = 'exe'
  silentArgs     = $silentArgs
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs

if ($pp.User) {
  $baseDir = [Environment]::GetFolderPath('LocalApplicationData')
} else {
  $baseDir = [Environment]::GetFolderPath('CommonApplicationData')
}

$majorVersion = $Env:PackageVersion -split '\.' | Select-Object -First 1
$executable   = '{0}\spyder-{1}\envs\spyder-runtime\Scripts\spyder.exe' -f $baseDir, $majorVersion

if (Test-Path -Path $executable -PathType Leaf) {
  Install-BinFile -Name 'spyder' -Path $executable
}
