# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@5d2eb9faae63c97246c26e86310ce1d07140eb88/icons/vscode-azure-deploy.png" width="48" height="48" />[Deprecated] Deploy to Azure VSCode Extension](https://community.chocolatey.org/packages/vscode-azure-deploy)

[![GitHub license](https://img.shields.io/badge/badges-MIT-green.svg)](https://marketplace.visualstudio.com/items/ms-vscode-deploy-azure.azure-deploy/license)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/ms-vscode-deploy-azure.azure-deploy?label=Marketplace)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-azure-deploy?label=Chocolatey)](https://community.chocolatey.org/packages/vscode-azure-deploy)

The software has been deprecated by Microsoft.

Please see the [deprecation notice](https://github.com/microsoft/vscode-deploy-azure/issues/239) for details.

As an alternative, you may choose to use [Starter workflows](https://docs.github.com/en/enterprise-cloud@latest/actions/using-workflows/using-starter-workflows)
from GitHub to quickly onboard your application to GitHub Actions.

You may alternatively choose to use [Create file API](https://docs.github.com/en/rest/reference/repos#create-or-update-file-contents)
to create a Actions workflow file and [Secrets API](https://docs.github.com/en/rest/reference/actions#secrets)
to create pre-requisites deployment secrets.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@7cc16910d5ffa6580693a2235429a304ea7c0227/deprecated/packages/vscode-azure-deploy/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.32.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
