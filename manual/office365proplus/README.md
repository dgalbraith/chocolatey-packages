# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@1a42aea114ac76b846a2356e26672b6a97cfd279/icons/office365proplus.png" width="48" height="48" />Office 365 Professional Plus](https://community.chocolatey.org/packages/office365proplus)

[![Software license](https://img.shields.io/badge/license-proprietary-lightgrey)](https://www.microsoft.com/servicesagreement)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/source-v16731.20354-blue.svg)](https://www.microsoft.com/en-us/download/details.aspx?id=49117)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/office365proplus?label=Chocolatey)](https://community.chocolatey.org/packages/office365proplus)

Get the latest versions of your familiar Office programs, such as Word, Excel and PowerPoint, and more, all in one convenient
subscription. This will download and silently install the entire Office 365 Professional Plus edition. A license is required
and you will be prompted to enter your account information upon first launching the software after install.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@54ec2631e7da5a274a7542e5592b29e8386685c9/manual/office365proplus/screenshot.png)

## Package parameters

The following package parameter can be set:

* `/ConfigPath` - (optional) Full path to custom install configuration.
e.g. `choco install office365proplus --params '/ConfigPath:c:\myConfig.xml'`

* `/Language` - (optional) The installation language. Defaults to match your OS language. [List of possible languages](https://docs.microsoft.com/en-us/deployoffice/overview-of-deploying-languages-in-office-365-proplus#languages-culture-codes-and-companion-proofing-languages)
e.g. `choco install office365proplus --params '/Language:de-de'`

## Notes

* This package is  manually updated.
* If the package does not represent the latest version please contact the maintainer(s) and let them know the package requires updating.
