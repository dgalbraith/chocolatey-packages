$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'

$pp = Get-PackageParameters

$components = @('data')

if ($pp.count -gt 0) {
  $pp.GetEnumerator() | foreach-object {
    switch ($_.name) {
        'clap' {
          $components += 'clap'
        }
        'effecdtsclap' {
          $components += 'effecdtsclap'
        }
        'vst3' {
          $components += 'vst3'
        }
        'effectsvst3' {
          $components += 'effectsvst3'
        }
        'sa' {
          $components += 'sa'
        }
        'effectssa' {
          $components += 'effectssa'
        }
        'data' {
          # ignoring as data is already included
        }
        'patches' {
          $components += 'patches'
        }
        'wavetables' {
          $components += 'wavetables'
        }
        Default {
          Write-Verbose("Unknown parameter $_ will be ignored")
        }
      }
    }  
} else {
  $components += @('clap','effectsclap','vst3','effectsvst3','sa','effectssa','patches','wavetables')
}

$silentArgs += " /COMPONENTS=`"{0}`"" -f ($components -join ",")

# the installer files are too large to be included in the package so provide for the common
# case of 64-bit distributed in the package and download the 32-bit version if needed
if ((Get-ProcessorBits 32) -or ($env:ChocolateyForceX86 -eq 'true')) {
  $packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'exe'
    softwareName   = 'Surge XT'
    url            = 'https://github.com/surge-synthesizer/releases-xt/releases/download/1.3.3/surge-xt-win32-1.3.3-setup.exe'
    checksum       = '16055d15e3041d9b5bb7a0cd7ce76be4acdb8554e30d79f140fd48c274003e9c'
    checksumType   = 'sha256'
    silentArgs     = $silentArgs
    validExitCodes = @(0)
  }
  Install-ChocolateyPackage @packageArgs
} else {
  $packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'exe'
    softwareName   = 'Surge XT'
    file64         = "$toolsDir\surge-xt-win64-1.3.3-setup.exe"
    silentArgs     = $silentArgs
    validExitCodes = @(0)
  }
  
  Install-ChocolateyInstallPackage @packageArgs  
}
