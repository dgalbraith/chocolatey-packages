# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@4a952cb67d3ba380d5d8dc2c26f1c41270affedf/icons/rammap.png" width="48" height="48" />RAMMap - Windows Sysinternals](https://chocolatey.org/packages/rammap)

[![Software License](https://img.shields.io/badge/License-Proprietary-grey.svg)](https://docs.microsoft.com/sysinternals/license-terms)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v1.61-blue)](https://docs.microsoft.com/sysinternals/downloads/rammap)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/rammap?label=Chocolatey)](https://chocolatey.org/packages/rammap)

Have you ever wondered exactly how Windows is assigning physical memory, how much file data is cached in RAM, or how
much RAM is used by the kernel and device drivers? RAMMap makes answering those questions easy. RAMMap is an advanced
physical memory usage analysis utility for Windows Vista and higher. It presents usage information in different ways on
its several different tabs:

* Use Counts: usage summary by type and paging list
* Processes: process working set sizes
* Priority Summary: prioritized standby list sizes
* Physical Pages: per-page use for all physical memory
* Physical Ranges: physical memory addresses
* File Summary: file data in RAM by file
* File Details: individual physical pages by file

Use RAMMap to gain understanding of the way Windows manages memory, to analyze application memory usage, or to answer
specific questions about how RAM is being allocated. RAMMap’s refresh feature enables you to update the display and it
includes support for saving and loading memory snapshots.

For definitions of the labels RAMMap uses as well as to learn about the physical-memory allocation algorithms used by
the Windows memory manager, please see [Windows Internals](https://docs.microsoft.com/en-us/sysinternals/resources/windows-internals).

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ab7733d9bd5714cac138fe9e5eec447633fb3d75/automatic/rammap/screenshot.png)

## Notes

* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
