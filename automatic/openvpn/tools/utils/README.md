# Chocolatey custom functions

The current development state of Chocolatey and the fact we have to support old Windows versions leads us to require some quirks or to reinvent the wheel at each Chocolatey package we write.

This repository aims at gathering some generic PowerShell 2.0 functions to be used with Chocolatey.

These are intended to work only for Chocolatey, although you can take inspiration from this work to write your own PowerShell functions.

## Features

* CreateTempDirPackageVersion
* PrintWhenVerbose
* GetServiceProperties
* SetServiceProperties
* CheckPGPSignature
* GetCertificateInfo
* AddTrustedPublisherCertificate
* RemoveTrustedPublisherCertificate

To see how these commands/functions work, simply read the documentation in the source file.

## Testing

Some functions can be tested outside Chocolatey only if these are not too tied to Chocolatey internals. To test these functions outside of Chocolatey, just copy them to another file and run the following command:

    powershell -ExecutionPolicy Unrestricted -File .\utils.ps1

Please note these functions come as a bundle and are not intended to be used as a standalone solution.

## Contributions

If you have comments to make or push requests to submit, you are welcome to contribute to this repository.

## License

[As Apache 2 software can be included in GPLv3 projects, but GPLv3 software cannot be included in Apache projects](https://www.apache.org/licenses/GPL-compatibility.html) and in order to comply with [NuGet](https://www.nuget.org/policies/About) and Chocolatey licenses, this software is licensed under the terms of the Apache License 2.0.
