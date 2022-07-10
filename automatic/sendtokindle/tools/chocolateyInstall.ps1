Set-Service `
    -Name 'Spooler' `
    -StartupType 'Automatic'

Install-ChocolateyPackage `
    -PackageName 'sendtokindle' `
    -FileType 'EXE' `
    -Silent '/S' `
    -Url 'http://s3.amazonaws.com/sendtokindle/SendToKindleForPC-installer.exe' `
    -Checksum '38A173669B3056F1C81E24145153BE2B781C2C9E44E0EAFD01E5C93D6DEEB1F0' `
    -ChecksumType 'SHA256' `
    -ValidExitCodes @(0, 1223)
