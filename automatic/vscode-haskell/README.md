# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@1fe0edcd52fc2a606d586b5ba2dd0fd9d5f6eb93/icons/vscode-haskell.png" width="48" height="48" />Haskell VSCode Extension](https://chocolatey.org/packages/vscode-haskell)

[![GitHub license](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/haskell/vscode-haskell/blob/master/License.txt)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/haskell.haskell?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=haskell.haskell)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-haskell?label=Chocolatey)](https://chocolatey.org/packages/vscode-haskell)

This extension adds language support for [Haskell](https://haskell.org/), powered by the [Haskell Language Server](https://github.com/haskell/haskell-language-server).

## Features

* Warning and error diagnostics from [GHC](https://www.haskell.org/ghc/)
* Type information and documentation on hover
* Jump to definition
* Document symbols
* Highlight references in document
* Code completion
* Formatting via [Brittany](https://hackage.haskell.org/package/brittany), [Floskell](https://hackage.haskell.org/package/floskell), [Ormolu](https://hackage.haskell.org/package/ormolu) or [Stylish Haskell](https://hackage.haskell.org/package/stylish-haskell)
* [Multi-root workspace](https://code.visualstudio.com/docs/editor/multi-root-workspaces) support
* Code evaluation ([Haskell Language Server](https://github.com/haskell/haskell-language-server#haskell-language-server))

## Package Requirements

* For standalone .hs/.lhs files, [GHC](https://www.haskell.org/ghc/) must be installed and on the PATH. The easiest way to install it is with the [GHC package](https://chocolatey.org/packages/ghc)
* The extension will download an appropriate `haskell-language-server` provided the ghc version is supported.  On Windows currently supported GHC versions are 8.6.4, 8.6.5 and 8.10.1 - `choco install ghc --version=8.6.4`, `choco install ghc --version=8.6.5` or `choco install ghc --version=8.10.1`
* For Cabal based projects, both GHC and [cabal-install](https://www.haskell.org/cabal/) must be installed and on the PATH. It can be installed
with the [Cabal package](https://chocolatey.org/packages/cabal) - `choco install cabal`
* For Stack based projects, [stack](http://haskellstack.org/) must be installed and on the PATH.  Stack can be installed with the
[haskell-stack package](https://chocolatey.org/packages/haskell-stack) - `choco install haskell-stack`

## Notes

* This package requires Visual Studio Code 1.39.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.f you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
