# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@c809e86a58e0c324229204801a3ebecd82edbfa7/icons/naps2.png" width="48" height="48" />NAPS2 (Not Another PDF Scanner 2) (Install)](https://chocolatey.org/packages/naps2.install)

[![GitHub license](https://img.shields.io/badge/License-GPLv2-blue.svg)](https://github.com/cyanfish/naps2/blob/master/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v7.5.3-blue)](https://github.com/cyanfish/naps2/releases/tag/v7.5.3)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/naps2.install?label=Chocolatey)](https://chocolatey.org/packages/naps2.install)

NAPS2 is a document scanning application with a focus on simplicity and ease of use. Scan your documents from WIA- and
TWAIN-compatible scanners, organize the pages as you like, and save them as PDF, TIFF, JPEG, PNG, and other file
formats.

## Features

* Scan documents using WIA- and TWAIN-compatible scanners
* Scan as many pages as you like from glass or ADF, including duplex support
* Rotate, crop, and rearrange scanned pages
* Save as PDF, TIFF, JPEG, PNG, or other file formats
* Directly email PDFs
* Use OCR to make PDFs searchable
* Import, merge, and edit PDFs
* Configure brightness, contrast, resolution, and other scan options
* Save your configurations as profiles to be easily reused later
* Optional command-line interface (CLI) for automation and scripting

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@c809e86a58e0c324229204801a3ebecd82edbfa7/automatic/naps2/screenshot.png)

## Package Parameters

* `/InstallDir=[directory]` - set the installation directory to `[directory]`
  e.g. `choco install -y naps2.install --package-parameters="/InstallDir=C:\Tools\NAPS2"`

To have Chocolatey remember parameters on upgrade, be sure to set `choco feature enable -n=useRememberedArgumentsForUpgrades`

## Notes

* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
