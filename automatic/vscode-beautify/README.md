# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@d08e1791b6c7ec1b1fad89e82242d8cc713834f4/icons/vscode-beautify.png" width="48" height="48" />Beautify VSCode Extension](<https://chocolatey.org/packages/vscode-beautify>)

[![GitHub license](https://img.shields.io/github/license/HookyQR/VSCodeBeautify)](https://github.com/HookyQR/VSCodeBeautify/blob/master/LICENSE.txt)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/HookyQR.beautify?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=HookyQR.beautify)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-beautify?label=Chocolatey)](https://chocolatey.org/packages/vscode-beautify)

Beautify `javascript`, `JSON`, `CSS`, `Sass`, and `HTML` in Visual Studio Code.

VS Code uses js-beautify internally, but it lacks the ability to modify the style you wish to use. This extension enables running [js-beautify](http://jsbeautifier.org/) in VS Code, *AND* honouring any `.jsbeautifyrc` file in the open file's path tree to load *your* code styling. Run with **F1** `Beautify` (to beautify a selection) or **F1** `Beautify file`.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@d08e1791b6c7ec1b1fad89e82242d8cc713834f4/automatic/vscode-beautify/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.22.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
