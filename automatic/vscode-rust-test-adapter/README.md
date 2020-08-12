# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@0f91b01ec8207cb79082d01f6cb9ef431b0fc69e/icons/vscode-rust-test-adapter.png" width="48" height="48" />Rust Test Explorer VSCode Extension](https://chocolatey.org/packages/vscode-rust-test-adapter)

[![GitHub license](https://img.shields.io/github/license/swellaby/vscode-rust-test-adapter)](https://github.com/swellaby/vscode-rust-test-adapter/blob/master/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/swellaby.vscode-rust-test-adapter?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=swellaby.vscode-rust-test-adapter)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-rust-test-adapter?label=Chocolatey)](https://chocolatey.org/packages/vscode-rust-test-adapter)

Rust Test Explorer for VS Code that enables viewing and running your Rust tests
from the VS Code Sidebar.

## Features

* Detected unit tests will be viewable and runnable from the Test Explorer window
as long as there is a Cargo.toml file in the root of the directory
* Works with Cargo Workspaces
* Works with packages that have both bin and lib targets
* Test tree will reflect the `package -> target -> module -> ...` hierarchical
structure
* Test tree will flatten the package level if there's only a single package,
and/or at the target level if a package only has a single target containing
unit tests

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@0f91b01ec8207cb79082d01f6cb9ef431b0fc69e/automatic/vscode-rust-test-adapter/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.21.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.f you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
