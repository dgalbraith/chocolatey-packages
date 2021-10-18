# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@d1474eaa642bfb53bc936d7c15ddfdff8b6e6ed2/icons/koodo-reader.png" width="48" height="48" />Koodo Reader - All-in-one eBook reader](https://chocolatey.org/packages/koodo-reader)

[![Software license](https://img.shields.io/github/license/troyeguo/koodo-reader)](https://github.com/troyeguo/koodo-reader/blob/master/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v1.3.2-blue.svg)](https://github.com/troyeguo/koodo-reader/releases/tag/v1.3.2)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/koodo-reader?label=Chocolatey)](https://chocolatey.org/packages/koodo-reader)

Koodo Reader is a full-featured ebook manager to help you better study and digest your books.

## Features

* Supports epub, pdf, mobi, azw3, txt, Markdown and djvu files
* Runs on Windows, macOS, Linux and Web
* Single-column, two-column, or continuous scrolling layouts
* Text-to-speech, Translation
* Bookmarks, Notes, Digests, Shelves and Tags
* Adjust font, line-spacing, background color, text color and margins
* Support for touch screens
* Night mode and Color Themes
* Text highlight, underline, Italic and shadow

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@d1474eaa642bfb53bc936d7c15ddfdff8b6e6ed2/automatic/koodo/screenshot.png)

## Package Parameters

The following package parameter can be set:

* `/AddToDesktop` - add desktop shortcuts for Koodoo Reader.  By default the shortcuts will be added for all users  
e.g. `choco install koodo-reader --package-parameters="/AddToDesktop"`
* `/AddToStartMenu` - add entries to the Start Menu for Koodoo Reader.  By default the shortcut will be added for all
users  
e.g. `choco install koodo-reader --package-parameters="/AddToStartMenu"`
* `/User` - where the user parameter is specified any shortcuts created (using `/AddToDesktop` or `/AddToStartMenu`)
will only be added for the current user  
e.g. `choco install koodo-reader --package-parameters="/AddToDesktop /User"`

To have Chocolatey remember parameters on upgrade, be sure to set `choco feature enable -n=useRememberedArgumentsForUpgrades`.

## Notes

* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
