# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ec1652f85e86682fba61efdbeb5a556dd6ad0284/icons/lsasecretsview.png" width="48" height="48"/>LSASecretsView - View LSA Secrets](https://chocolatey.org/packages/lsasecretsview)

[![Software license](https://img.shields.io/badge/license-freeware-orange)](http://www.nirsoft.net/utils/lsa_secrets_view.html)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v1.25-blue.svg)](http://www.nirsoft.net/utils/lsa_secrets_view.html)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/lsasecretsview?label=Chocolatey)](https://chocolatey.org/packages/lsasecretsview)

LSASecretsView is a small utility that displays the list of all LSA secrets stored in the Registry on your computer.

The LSA secrets key is located under HKEY_LOCAL_MACHINE\Security\Policy\Secrets and may contain your RAS/VPN passwords, Autologon password, and other system passwords/keys.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@48b2855247b0e422e994f50e85b9bf8c8ca98c79/automatic/lsasecretsview/screenshot.png)

## Notes

* The 32-bit version of LSASecretsView will not run in a 64-bit environment and the installation will fail if forced with `--forceX86`
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
