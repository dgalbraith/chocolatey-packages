# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@76935c808211166e58f5e5c59367dee255635018/icons/vscode-live-share.png" width="48" height="48" />Live Share VSCode Extension](<https://chocolatey.org/packages/vscode-live-share>)

[![Software license](https://img.shields.io/badge/license-Proprietary-lightgrey)](https://marketplace.visualstudio.com/items/MS-vsliveshare.vsliveshare/license)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/MS-vsliveshare.vsliveshare?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-live-share?label=Chocolatey)](https://chocolatey.org/packages/vscode-live-share)

Live Share enables you to collaboratively edit and debug with others in real time, regardless of the programming
languages you're using or app types you're building. You can instantly and securely share your current project, start
a joint debugging session, share terminal instances, forward localhost web apps, and more!

Unlike traditional pair programming, Visual Studio Live Share allows developers to work together, while retaining their
personal editor preferences (e.g. theme, keybindings), as well as having their own cursor. This allows you to
seamlesslytransition between following one another, and being able to explore ideas/tasks on your own. This ability to
work together and independently provides a collaboration experience that feels much like in-person collaboration.

## Features

* **Live Editing** - author and edit code together in real time
* **Group debugging** - set breakpoints and step through code together
* **Focus and follow** - bring attention to your cursor or follow along as others navigate
* **Shared servers** - view web apps and databases without exposing ports to the internet
* **Shared terminal** - run commands and tasks, with output streamed to team members

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@76935c808211166e58f5e5c59367dee255635018/automatic/vscode-live-share/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.40.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
