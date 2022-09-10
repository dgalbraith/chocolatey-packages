# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@236a257aaf4920b7b1b4c6b0cd29eca8c5026e91/icons/vscode-edge-debug.png" width="48" height="48" />Debugger for Edge VSCode Extension](<https://chocolatey.org/packages/vscode-edge-debug>)

[![GitHub license](https://img.shields.io/github/license/microsoft/vscode-edge-debug)](https://github.com/microsoft/vscode-edge-debug2/blob/master/LICENSE.txt)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/badge/Marketplace-v1.0.15-orange)](https://chocolatey.org/packages/vscode-edge-debug)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-edge-debug?label=Chocolatey)](https://chocolatey.org/packages/vscode-edge-debug)

A VS Code extension to debug your JavaScript code in the Microsoft Edge browser. This is also used to enable JavaScript debugging inside the Microsoft Edge browser when launched from ASP.Net Projects in Visual Studio.

**Note:** This extension has been deprecated as Visual Studio Code now has a [bundled JavaScript Debugger](https://github.com/microsoft/vscode-js-debug) that
covers the same functionality. It is a debugger that debugs Node.js, Chrome, Edge (Chromium), WebView2, VS Code extensions, and more. You can safely
un-install this extension and you will still be able to have the functionality you need.

Note that the new bundled debugger only supports Edge (Chromium), and does not support legacy Microsoft Edge (EdgeHTML). For debugging legacy Edge, you will still need this extension.

## Supported features

* Setting breakpoints, including in source files when source maps are enabled
* Stepping through the code
* The Locals pane
* Debugging eval scripts, script tags, and scripts that are added dynamically
* Watches

## Unsupported scenarios

* Debugging web workers
* Any features that aren't script debugging

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@2f53ef5e87499f4414ca9e86cf314e14b02ffedf/manual/vscode-edge-debug/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.17.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
