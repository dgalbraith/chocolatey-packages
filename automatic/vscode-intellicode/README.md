# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@8c5592c5c04a7de4544145427fb03cbe2ac9b969/icons/vscode-intellicode.png" width="48" height="48" />IntelliCode for VSCode Extension](<https://chocolatey.org/packages/vscode-intellicode>)

[![GitHub license](https://img.shields.io/github/license/MicrosoftDocs/intellicode)](https://github.com/MicrosoftDocs/intellicode/blob/master/LICENSE-CODE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/VisualStudioExptTeam.vscodeintellicode?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-intellicode?label=Chocolatey)](<https://chocolatey.org/packages/vscode-intellicode>)

The [Visual Studio IntelliCode](https://visualstudio.microsoft.com/services/intellicode/) extension provides AI-assisted development features for Python, TypeScript/JavaScript and Java developers in Visual Studio Code, with insights based on understanding your code context combined with machine learning.

This extension provides AI-assisted IntelliSense by showing recommended completion items for your code context at the top of the completions list.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@217ab4e586b2f1acb00d25d0d3fa023e9b07ed98/automatic/vscode-intellicode/screenshot.png)

When it comes to overloads, rather than taking the time to cycle through the alphabetical list of member, IntelliCode presents the most relevant one first. In the example shown above, you can see that the predicted APIs that **IntelliCode** elevates appear in a new section of the list at the top with members prefixed by a star icon. Similarly, a member’s signature or overloads shown in the IntelliSense tool-tip will have additional text marked by a small star icon and wording to explain the recommended status. This visual experience for members in the list and the tool-tip that **IntelliCode** provides is not intended as final – it is intended to provide you with a visual differentiation for feedback purposes only.

Contextual recommendations are based on practices developed in thousands of high quality, open-source projects on GitHub each with high star ratings. This means you get context-aware code completions, tool-tips, and signature help rather than alphabetical or most-recently-used lists. By predicting the most likely member in the list based on your coding context, AI-assisted IntelliSense stops you having to hunt through the list yourself.

## Notes

* This package requires Visual Studio Code 1.77.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
