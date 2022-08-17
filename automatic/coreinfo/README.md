# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@024a0e31a291ceea63f7af5e63e2679403c5aa8f/icons/sysinternals.png" width="48" height="48" />Coreinfo - Windows Sysinternals](https://chocolatey.org/packages/coreinfo)

[![Software License](https://img.shields.io/badge/License-Proprietary-grey.svg)](https://docs.microsoft.com/en-us/sysinternals/license-terms)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v3.53-blue)](https://docs.microsoft.com/sysinternals/downloads/coreinfo)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/coreinfo?label=Chocolatey)](https://chocolatey.org/packages/coreinfo)

Coreinfo is a command-line utility that shows you the mapping between logical processors and the physical processor,
NUMA node, and socket on which they reside, as well as the cache’s assigned to each logical processor. It uses the
Windows’ [GetLogicalProcessorInformation](https://docs.microsoft.com/en-us/windows/win32/api/sysinfoapi/nf-sysinfoapi-getlogicalprocessorinformation)
function to obtain this information and prints it to the screen, representing a mapping to a logical processor with an
asterisk e.g. ‘*’. Coreinfo is useful for gaining insight into the processor and cache topology of your system.

Usage: `coreinfo [-c][-f][-g][-l][-n][-s][-m][-v]`

Parameter | Description
:--------:|------------
-c        | Dump information on cores.
-f        | Dump core feature information.
-g        | Dump information on groups.
-l        | Dump information on caches.
-n        | Dump information on NUMA nodes.
-s        | Dump information on sockets.
-m        | Dump NUMA access cost.
-v        | Dump only virtualization-related features including support for second level address translation.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ab7733d9bd5714cac138fe9e5eec447633fb3d75/automatic/coreinfo/screenshot.png)

## Notes

* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
