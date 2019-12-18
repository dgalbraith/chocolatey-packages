# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@9678bf5fd1d07c6f7a2dd3d08da205d8ad75ca59/icons/vscode-cloud-code.png" width="48" height="48" />Visual Studio Online VSCode Extension](<https://chocolatey.org/packages/vscode-vsonline>)

[![Software license](https://img.shields.io/badge/license-Proprietary-lightgrey)](https://marketplace.visualstudio.com/items/ms-vsonline.vsonline/license)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/ms-vsonline.vsonline?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=ms-vsonline.vsonline)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-cloud-code?label=Chocolatey)](https://chocolatey.org/packages/vscode-vsonline)

Visual Studio Online provides cloud-powered development environments for any activity - whether it's a long-term project, or a short-term task like reviewing a pull request. You can work with these environments from Visual Studio Code, Visual Studio ([sign up for the Private Preview](https://aka.ms/vsfutures-signup)), or a browser-based editor that's accessible anywhere! You can even connect your own self-hosted environments to Visual Studio Online at no cost.

Additionally, Visual Studio Online brings many of the benefits of DevOps, like repeatability and reliability, which have typically been reserved for production workloads, to development environments. However, Visual Studio Online is also personaliazable to allow developers to leverage the tools, processes and configurations that they have come to love and rely on - truly the best of both worlds!

Learn more at [online.visualstudio.com](http://online.visualstudio.com/).

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@9678bf5fd1d07c6f7a2dd3d08da205d8ad75ca59/automatic/vscode-vsonline/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.40.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
