# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@2e74b6c729257b8884641440772f09d1453ad178/icons/vscode-python-test-adapter.png" width="48" height="48" />Python Test Explorer VSCode Extension](https://chocolatey.org/packages/vscode-python-test-adapter)

[![GitHub license](https://img.shields.io/github/license/kondratyev-nv/vscode-python-test-adapter)](https://github.com/kondratyev-nv/vscode-python-test-adapter/blob/master/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/LittleFoxTeam.vscode-python-test-adapter?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=LittleFoxTeam.vscode-python-test-adapter)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-python-test-adapter?label=Chocolatey)](https://chocolatey.org/packages/vscode-python-test-adapter)

This extension allows you to run your Python [Unittest](https://docs.python.org/3/library/unittest.html#module-unittest)
or [Pytest](https://docs.pytest.org/en/latest/) tests with the [Test Explorer UI](https://marketplace.visualstudio.com/items?itemName=hbenl.vscode-test-explorer).

## Features

* Shows a Test Explorer in the Test view in VS Code's sidebar with all detected tests and suites and their state
* Convenient error reporting during test discovery
* Unittest and Pytest debugging
* Shows a failed test's log when the test is selected in the explorer
* Supports multi-root workspaces
* Supports Unittest and Pytest test frameworks and their plugins

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@2e74b6c729257b8884641440772f09d1453ad178/automatic/vscode-python-test-adapter/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.23.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.f you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
