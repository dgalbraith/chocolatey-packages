# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ad34a1763216744b71bb9261fe8cd9927d26f34b/icons/vscode-drawio.png" width="48" height="48" />Draw.io VSCode Extension](<https://chocolatey.org/packages/vscode-drawio>)

[![GitHub license](https://img.shields.io/github/license/hediet/vscode-drawio)](https://github.com/hediet/vscode-drawio/blob/master/LICENSE.md)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/hediot.vscode-drawio?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=hediot.vscode-drawio)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-drawio?label=Chocolatey)](https://chocolatey.org/packages/vscode-drawio)

This extension integrates [Draw.io](https://app.diagrams.net/) into VS Code.

## Features

* Edit `.drawio`, `.dio` or `.drawio.svg` files in the Draw.io editor.
* To create a new diagram, simply create an empty `*.drawio` or `*.drawio.svg` file and open it!
* `.drawio.svg` are valid `.svg` files that can be embedded in Github readme files! No export needed.
* To convert a Draw.io file from `.drawio` to `.drawio.svg`, use the `File: Save As` command.
* Uses an offline version of Draw.io by default.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ad34a1763216744b71bb9261fe8cd9927d26f34b/automatic/vscode-drawio/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.44.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
