# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@2b1c888fbc68d148d638cae0b6f0222b97f156db/icons/rsync.png" width="48" height="48" />cwRsync (Free Edition)](https://chocolatey.org/packages/rsync)

[![Software license](https://img.shields.io/badge/License-Simplified%20BSD-green.svg)](https://itefix.net/simplified-bsd-license)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v6.3.0-blue.svg)](https://www.itefix.net/cwrsync?qt-cwrsync_client=1&qt-cwrsync=1#qt-cwrsync)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/rsync?label=Chocolatey)](https://chocolatey.org/packages/rsync)

Rsync is a fast and extraordinarily versatile file copying tool for both remote and local files.

Rsync uses a delta-transfer algorithm which provides a very fast method for bringing remote files into sync. It does
this by sending just the differences in the files across the link, without requiring that both sets of files are at one
of the ends of the link beforehand. At first glance this may seem impossible because the calculation of diffs two files
normally requires local access to both files.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@2b1c888fbc68d148d638cae0b6f0222b97f156db/automatic/rsync/screenshot.png)

## Notes

* cwRSync uses the Windows user profile directories as home
* Current versions of rsync are only provided as a 64-bit version
* If support for 32-bit Windows is required use the legacy version [rsync 5.5.0.20190204](https://chocolatey.org/packages/rsync/5.5.0.20190204).

  ```powershell
  choco install rsync --version 5.5.0.20190204
  choco pin add -n=rsync --version 5.5.0.20190204
  ```

* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
