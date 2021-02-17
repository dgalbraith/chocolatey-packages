# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@024a0e31a291ceea63f7af5e63e2679403c5aa8f/icons/sysinternals.png" width="48" height="48" />PipeList - Windows Sysinternals](https://chocolatey.org/packages/pipelist)

[![Software License](https://img.shields.io/badge/License-Proprietary-grey.svg)](https://docs.microsoft.com/sysinternals/license-terms)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v1.01-blue)](https://docs.microsoft.com/sysinternals/downloads/logonsessions)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/pipelist?label=Chocolatey)](https://chocolatey.org/packages/pipelist)

Displays the named pipes on your system, including the number of maximum instances and active instances for each pipe.

The device driver that implements named pipes is actually a file system driver? In fact, the driver's name is NPFS.SYS,
for "Named Pipe File System". What you might also find surprising is that its possible to obtain a directory listing of
the named pipes defined on a system. This fact is not documented, nor is it possible to do this using the Win32 API.
Directly using NtQueryDirectoryFile, the native function that the Win32 FindFile APIs rely on, makes it possible to
list the pipes. The directory listing NPFS returns also indicates the maximum number of pipe
instances set for each pipe and the number of active instances.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ab7733d9bd5714cac138fe9e5eec447633fb3d75/automatic/pipelist/screenshot.png)

## Notes

* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
