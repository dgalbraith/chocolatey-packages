# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@f6955499323841ec9a33508345bfe5257fcfee78/icons/vscode-go.png" width="48" height="48" />Go VSCode Extension](<https://chocolatey.org/packages/vscode-go>)

[![GitHub license](https://img.shields.io/github/license/golang/vscode-go)](https://github.com/golang/vscode-go/blob/master/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/golang.Go?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=golang.Go)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-go?label=Chocolatey)](https://chocolatey.org/packages/vscode-go)

This extension adds rich language support for the [Go language](https://golang.org/) to VS Code.

## Features

* [Intellisense](https://github.com/golang/vscode-go/blob/master/docs/features.md#intellisense)
* [Code Navigation](https://github.com/golang/vscode-go/blob/master/docs/features.md#code-navigation)
* [Code Editing](https://github.com/golang/vscode-go/blob/master/docs/features.md#code-editing)
* [Diagnostics](https://github.com/golang/vscode-go/blob/master/docs/features.md#diagnostics)
* [Testing](https://github.com/golang/vscode-go/blob/master/docs/features.md#run-and-test-in-the-editor)
* [Debugging](https://github.com/golang/vscode-go/blob/master/README.md#debugging)

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@f6955499323841ec9a33508345bfe5257fcfee78/automatic/vscode-go/screenshot.png)

## Notes

* Additional Go tool setup is required to use this extension so follow the [getting started](https://github.com/golang/vscode-go/blob/master/README.md#getting-started) instructions.
* This package requires Visual Studio Code 1.59.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
