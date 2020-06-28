# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@53c9d779f0f73975196bcc6bac1b1718dcfe71a0/icons/vscode-live-share-audio.png" width="48" height="48" />Live Share Audio VSCode Extension](<https://chocolatey.org/packages/vscode-live-share-audio>)

[![Software license](https://img.shields.io/badge/license-Proprietary-lightgrey)](https://marketplace.visualstudio.com/items/MS-vsliveshare.vsliveshare-audio/license)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/MS-vsliveshare.vsliveshare-audio?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare-audio)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-live-share-audio?label=Chocolatey)](https://chocolatey.org/packages/vscode-live-share-audio)

Visual Studio Live Share Audio enhances the existing [Visual Studio Live Share](https://aka.ms/vsls) experience, by
enabling you to quickly spin up an audio call directly from within Visual Studio Code, without needing to use a
separate tool or service. Participants within a Live Share session can automatically join the call, and chat amongst
each other, without needing to first coordinate which voice communication tool to use. For certain use cases (e.g. online
training/mentoring, hack-a-thons), this can dramatically help reduce the barriers for collaboration.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@53c9d779f0f73975196bcc6bac1b1718dcfe71a0/automatic/vscode-live-share-audio/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.21.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
