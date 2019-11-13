# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@1d50526002930359ca29f0722608cc1f0cf99e37/icons/vscode-chrome-debug.png" width="48" height="48" />Debugger for Chrome VSCode Extension](<https://chocolatey.org/packages/vscode-chrome-debug>)

[![GitHub license](https://img.shields.io/github/license/microsoft/vscode-chrome-debug)](https://github.com/microsoft/vscode-chrome-debug/blob/master/LICENSE.txt)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/msjsdiag.debugger-for-chrome?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=msjsdiag.debugger-for-chrome)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-firefox-debug?label=Chocolatey)](https://chocolatey.org/packages/vscode-chrome-debug)

A VS Code extension to debug your JavaScript code in the Google Chrome browser, or other targets that support the [Chrome DevTools Protocol](https://chromedevtools.github.io/debugger-protocol-viewer/).

## Supported features

* Setting breakpoints, including in source files when source maps are enabled
* Stepping, including with the buttons on the Chrome page
* The Locals pane
* Debugging eval scripts, script tags, and scripts that are added dynamically
* Watches
* Console

## Unsupported scenarios

* Debugging web workers
* Debugging Chrome extensions
* Any features that aren't script debugging

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@1d50526002930359ca29f0722608cc1f0cf99e37/automatic/vscode-chrome-debug/screenshot.png)

## Notes

* This package requires Visual Studio Code.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in any edition of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup
  if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
