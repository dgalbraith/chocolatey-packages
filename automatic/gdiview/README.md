# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ec1652f85e86682fba61efdbeb5a556dd6ad0284/icons/gdiview.png" width="48" height="48"/>GDIView - Display GDI Handles](https://chocolatey.org/packages/gdiview)

[![Software license](https://img.shields.io/badge/license-freeware-orange)](http://www.nirsoft.net/utils/gdi_handles.html)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v1.26-blue.svg)](http://www.nirsoft.net/utils/gdi_handles.html)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/gdiview?label=Chocolatey)](https://chocolatey.org/packages/gdiview)

GDIView is a unique tool that displays the list of GDI handles (brushes, pens, fonts, bitmaps, and others) opened by every process. It displays the total count for each type of GDI handle, as well as detailed information about each handle.

This tool can be useful for developers that need to trace GDI resources leak in their software.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@48b2855247b0e422e994f50e85b9bf8c8ca98c79/automatic/gdiview/screenshot.png)

## Notes

* The 32-bit version of GDIView will not run in a 64-bit environment and the installation will fail if forced with `--forceX86`
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
