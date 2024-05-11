# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@f1075d8ebcef438242228bccd7320aff28f82ed0/icons/sysinternals.png" width="48" height="48" />PsTools - Sysinternals System Management Suite](https://community.chocolatey.org/packages/pstools)

[![Software License](https://img.shields.io/badge/License-Proprietary-grey.svg)](https://learn.microsoft.com/sysinternals/license-terms)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v1.2023.04.11-blue)](https://learn.microsoft.com/en-gb/sysinternals/downloads/pstools)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/pstools?label=Chocolatey)](https://community.chocolatey.org/packages/pstools)

The Windows NT and Windows 2000 Resource Kits come with a number of command-line tools that help you administer
your Windows NT/2K systems. Over time, I've grown a collection of similar tools, including some not included in the
Resource Kits. What sets these tools apart is that they all allow you to manage remote systems as well as the local one.
The first tool in the suite was PsList, a tool that lets you view detailed information about processes, and the suite is
continually growing. The "Ps" prefix in PsList relates to the fact that the standard UNIX process listing command-line tool
is named "ps", so I've adopted this prefix for all the tools in order to tie them together into a suite of tools named
*PsTools*.

## Features

The tools included in the PsTools suite, which are downloadable as a package, are:

* PsExec - execute processes remotely
* PsFile - shows files opened remotely
* PsGetSid - display the SID of a computer or a user
* PsInfo - list information about a system
* PsPing - measure network performance
* PsKill - kill processes by name or process ID
* PsList - list detailed information about processes
* PsLoggedOn - see who's logged on locally and via resource sharing (full source is included)
* PsLogList - dump event log records
* PsPasswd - changes account passwords
* PsService - view and control services
* PsShutdown - shuts down and optionally reboots a computer
* PsSuspend - suspends processes

## Package Parameters

The following package parameter can be set:

* `/AcceptEula` - set the EULA for the tools to accepted on installation.  This is at a user level so will only be for the *current user*.
e.g. `choco install -y pstools --package-parameters="/AcceptEula"`

## Notes

* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly
