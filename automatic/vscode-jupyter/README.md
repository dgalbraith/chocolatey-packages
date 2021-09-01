# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@0fe70bbd7b56bf474007df2012f64bcecc623d0a/icons/vscode-jupyter.png" width="48" height="48" />Jupyter VSCode Extension](https://chocolatey.org/packages/vscode-jupyter)

[![Software license](https://img.shields.io/badge/license-Proprietary-lightgrey)](https://marketplace.visualstudio.com/items/ms-toolsai.jupyter/license)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/ms-toolsai.jupyter?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-jupyter?label=Chocolatey)](https://chocolatey.org/packages/vscode-jupyter)

A [Visual Studio Code](https://code.visualstudio.com/) [extension](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter)
that provides basic notebook support for [language kernels](https://github.com/jupyter/jupyter/wiki/Jupyter-kernels) that are supported in
[Jupyter Notebooks](https://jupyter.org/) today.  Many language kernels will work with no modification.  To enable advanced features,
modifications may be needed in the VS Code language extensions.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@0fe70bbd7b56bf474007df2012f64bcecc623d0a/automatic/vscode-jupyter/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.60.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
