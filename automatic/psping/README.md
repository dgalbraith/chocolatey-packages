# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@f1075d8ebcef438242228bccd7320aff28f82ed0/icons/sysinternals.png" width="48" height="48" />PsPing - Windows Sysinternals](https://community.chocolatey.org/packages/psping)

[![Software License](https://img.shields.io/badge/License-Proprietary-grey.svg)](https://learn.microsoft.com/sysinternals/license-terms)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v2.11-blue)](https://learn.microsoft.com/en-gb/sysinternals/downloads/pstools)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/pstools?label=Chocolatey)](https://community.chocolatey.org/packages/psping)

PsPing implements Ping functionality, TCP ping, latency and bandwidth measurement.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@24fea36a195c2c0f2ab7b70a195b03607cc45991/automatic/psping/screenshot.png)

## Package Parameters

The following package parameter can be set:

* `/AcceptEula` - set the EULA for the tools to accepted on installation.  This is at a user level so will only be for the *current user*.
e.g. `choco install -y pstools --package-parameters="/AcceptEula"`

## Notes

* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly
