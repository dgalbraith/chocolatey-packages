# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@5666967194fd19b53cf4dbf35b22496b1997c1bc/icons/cloc.png" width="48" height="48" />Count Lines of Code (CLOC)](https://chocolatey.org/packages/cloc)

[![Software license](https://img.shields.io/badge/License-GPLv2-blue.svg)](https://github.com/AlDanial/cloc/blob/master/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v1.98-blue.svg)](https://github.com/AlDanial/cloc/releases/tag/1.98)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/cloc?label=Chocolatey)](https://chocolatey.org/packages/cloc)

cloc counts blank lines, comment lines, and physical lines of source code in many programming languages.  Given two
versions of a code base, cloc can compute differences in blank, comment, and source lines.  It is written entirely in
Perl with no dependencies outside the standard distribution of Perl v5.6 and higher (code from some external modules
is embedded within cloc) and so is quite portable.  cloc is known to run on many flavors of Linux, FreeBSD, NetBSD,
OpenBSD, Mac OS X, AIX, HP-UX, Solaris, IRIX, z/OS, and Windows.

## Features

* Exists as a single, self-contained file that requires minimal installation effort - just download the file and run it
* Can read language comment definitions from a file and thus potentially work with computer languages that do not yet exist
* Allows results from multiple runs to be summed together by language and by project
* Can produce results in a variety of formats: plain text, SQL, JSON, XML, YAML, comma separated values
* Can count code within compressed archives (tar balls, Zip files, Java .ear files)
* Has numerous troubleshooting options
* Handles file and directory names with spaces and other unusual characters
* Has no dependencies outside the standard Perl distribution
* Runs on Linux, FreeBSD, NetBSD, OpenBSD, Mac OS X, AIX, HP-UX, Solaris, IRIX, and z/OS systems that have Perl 5.6 or higher
* The source version runs on Windows with either ActiveState Perl, Strawberry Perl, Cygwin, or MobaXTerm+Perl plugin
* On Windows one can run the Windows binary which has no dependencies

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@5666967194fd19b53cf4dbf35b22496b1997c1bc/automatic/cloc/screenshot.png)

## Notes

* Current versions of cloc provide 64-bit support only - for a 32-bit operating system use [cloc 1.84](https://chocolatey.org/packages/cloc/1.84).
  
  ```powershell
  choco install cloc --version 1.84
  choco pin add -n=cloc --version 1.84
  ```
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
