# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@024a0e31a291ceea63f7af5e63e2679403c5aa8f/icons/sysinternals.png" width="48" height="48" />Logon Sessions - Windows Sysinternals](https://chocolatey.org/packages/logonsessions)

[![Software License](https://img.shields.io/badge/License-Proprietary-grey.svg)](https://docs.microsoft.com/sysinternals/license-terms)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v1.41-blue)](https://docs.microsoft.com/sysinternals/downloads/logonsessions)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/logonsessions?label=Chocolatey)](https://chocolatey.org/packages/logonsessions)

If you think that when you logon to a system there's only one active logon session, this utility will surprise you. It
lists the currently active logon sessions and, if you specify the -p option, the processes running in each session.

Usage: `logonsessions [-c[t]] [-p]`

Parameter | Description
:--------:|------------
-c        | Print output as CSV
-ct       | Print output as tab-delimited values
-p        | List processes in each logon session

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ab7733d9bd5714cac138fe9e5eec447633fb3d75/automatic/logonsessions/screenshot.png)

## Notes

* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
