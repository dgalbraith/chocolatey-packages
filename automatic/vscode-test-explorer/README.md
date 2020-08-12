# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@84caa278732a2ec09d33dae120723b2f8de96bc2/icons/vscode-test-explorer.png" width="48" height="48" />Test Explorer UI VSCode Extension](https://chocolatey.org/packages/vscode-test-explorer)

[![GitHub license](https://img.shields.io/github/license/hbenl/vscode-test-explorer)](https://github.com/hbenl/vscode-test-explorer/blob/master/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/hbenl.vscode-test-explorer?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=hbenl.vscode-test-explorer)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-test-explorer?label=Chocolatey)](https://chocolatey.org/packages/vscode-test-explorer)

The Test Explorer extension provides an extensible user interface for running
your tests in VS Code. It can be used with any testing framework if there is a
corresponding [Test Adapter extension](https://marketplace.visualstudio.com/items?itemName=hbenl.vscode-test-explorer#test-adapters).

Other extensions can get full access to the Test Adapters by acting as
[Test Controllers](https://marketplace.visualstudio.com/items?itemName=hbenl.vscode-test-explorer#test-controllers).

The Test Explorer can also be used in [VS Live Share](https://aka.ms/vsls)
sessions by installing the [Test Explorer Live Share](https://chocolatey.org/packages/vscode-test-explorer-live-share) extension.

This extension is not stand-alone and requires one of the language-specific
[Test Adapters](https://marketplace.visualstudio.com/items?itemName=hbenl.vscode-test-explorer#test-adapters)
to function.  This extension will be automatically installed as a dependency when you
install one of these Test Adapters, so there is usually no need to install this
extension manually.

Chocolatey packages are available for a number of [Test Adapters](https://www.chocolatey.org/packages?q=tag%3Avscode-test-explorer-adapter)
and [Test Controllers](https://www.chocolatey.org/packages?q=tag%3Avscode-test-explorer-controller).

## Notes

* This package requires Visual Studio Code 1.38.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
