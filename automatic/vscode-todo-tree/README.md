# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@5804bdc4730cde93947ce391ea948e305c3cc472/icons/vscode-todo-tree.png" width="48" height="48" /> Todo Tree VSCode Extension](<https://chocolatey.org/packages/vscode-todo-tree>)

[![GitHub license](https://img.shields.io/github/license/Gruntfuggly/todo-tree)](https://github.com/Gruntfuggly/todo-tree/blob/master/License.txt)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/Gruntfuggly.todo-tree?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-todo-tree?label=Chocolatey)](<https://chocolatey.org/packages/vscode-todo-tree>)

This extension quickly searches (using [ripgrep](https://github.com/BurntSushi/ripgrep)) your workspace for comment tags like TODO and FIXME, and displays them in a tree view in the explorer pane. Clicking a TODO within the tree will open the file and put the cursor on the line containing the TODO.

Found TODOs can also be highlighted in open files.

## Notes

* This package requires Visual Studio Code.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in any edition of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup
  if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@5804bdc4730cde93947ce391ea948e305c3cc472/automatic/vscode-todo-tree/screenshot.png)
