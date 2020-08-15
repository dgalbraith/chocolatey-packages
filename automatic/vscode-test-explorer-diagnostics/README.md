# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@285318c5a827a9f0d7579e1ca2f733210781e47e/icons/vscode-test-explorer-diagnostics.png" width="48" height="48" />Test Explorer Diagnostics VSCode Extension](https://chocolatey.org/packages/vscode-test-explorer-diagnostics)

[![GitHub license](https://img.shields.io/github/license/emilyst/vscode-test-explorer-diagnostics)](https://github.com/emilyst/vscode-test-explorer-diagnostics/blob/master/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/emilylilylime.vscode-test-explorer-diagnostics?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=emilylilylime.vscode-test-explorer-diagnostics)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-test-explorer-diagnostics?label=Chocolatey)](https://chocolatey.org/packages/vscode-test-explorer-diagnostics)

A Visual Studio Code extension for the [Test Explorer UI](https://marketplace.visualstudio.com/items?itemName=hbenl.vscode-test-explorer) which populates test outcomes as diagnostics in the Problems panel.

Using the test states known to the Test Explorer, it populates diagnostics in Visual Studio Code. These appear in the Problems panel.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@285318c5a827a9f0d7579e1ca2f733210781e47e/automatic/vscode-test-explorer-diagnostics/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.45.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
