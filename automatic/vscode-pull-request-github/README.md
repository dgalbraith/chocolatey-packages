# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@26571f0d41c79f663383da0b4ba7c65854da63c0/icons/vscode-pull-request-github.png" width="48" height="48" />GitHub Pull Requests and Issues VSCode Extension](<https://chocolatey.org/packages/vscode-pull-request-github>)

[![GitHub license](https://img.shields.io/github/license/microsoft/vscode-pull-request-github)](https://github.com/microsoft/vscode-pull-request-github/blob/master/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/GitHub.vscode-pull-request-github?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-pull-request-github?label=Chocolatey)](https://chocolatey.org/packages/vscode-pull-request-github)

This extension allows you to review and manage [GitHub](https://github.com) pull requests and issues in Visual Studio Code.

## Features

* Authenticating and connecting VS Code to GitHub.
* Listing and browsing PRs from within VS Code.
* Reviewing PRs from within VS Code with in-editor commenting.
* Validating PRs from within VS Code with easy checkouts.
* Terminal integration that enables UI and CLIs to co-exist.
* Listing and browsing issues from within VS Code.
* Hover cards for "@" mentioned users and for issues.
* Completion suggestions for users and issues.
* A "Start working on issue" action which can create a branch for you.
* Code actions to create issues from "todo" comments.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@26571f0d41c79f663383da0b4ba7c65854da63c0/automatic/vscode-pull-request-github/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.58.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
