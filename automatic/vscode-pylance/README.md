# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@213f8fd6ef930c15ec50d9ff5290cbdb80c13c5b/icons/vscode-pylance.png" width="48" height="48" />Pylance VSCode Extension](https://chocolatey.org/packages/vscode-pylance)

[![Software license](https://img.shields.io/badge/license-Proprietary-lightgrey)](https://marketplace.visualstudio.com/items/ms-python.vscode-pylance/license)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/ms-python.vscode-pylance?label=marketplace)](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-pylance?label=Chocolatey)](https://chocolatey.org/packages/vscode-pylance)

Pylance is an extension that works alongside Python in Visual Studio Code to provide performant
language support. Under the hood, Pylance is powered by [Pyright](https://github.com/microsoft/pyright), Microsoft's static type checking tool. Using Pyright,
Pylance has the ability to supercharge your Python IntelliSense experience with rich type information, helping you write better code faster.

The Pylance name is a small ode to [Monty Python's Lancelot](https://hero.fandom.com/wiki/Sir_Lancelot_(Monty_Python)) who was the first knight to answer the
bridgekeeper's questions in the [Holy Grail](https://en.wikipedia.org/wiki/Monty_Python_and_the_Holy_Grail).

## Features

* Docstrings
* Signature help, with type information
* Parameter suggestions
* Code completion
* Auto-imports (as well as add and remove import code actions)
* As-you-type reporting of code errors and warnings (diagnostics)
* Code outline
* Code navigation
* Code lens (references/implementations)
* Type checking mode
* Native multi-root workspace support
* IntelliCode compatibility
* Jupyter Notebooks compatibility

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@213f8fd6ef930c15ec50d9ff5290cbdb80c13c5b/automatic/vscode-pylance/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.86.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
