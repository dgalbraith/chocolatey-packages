# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ea605aa7b94cc03226b076a979a37f9b026ab791/icons/keys.png" width="48" height="48"/>Keys - Cryptographic Key Management](<https://chocolatey.org/packages/keys>)

[![GitHub license](https://img.shields.io/github/license/keys-pub/keys)](https://github.com/keys-pub/keys/blob/master/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/version-0.1.15-blue)](https://github.com/keys-pub/app/releases/tag/v0.1.15)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/keys?label=Chocolatey)](https://chocolatey.org/packages/keys)

Key management is hard. We need tools, libraries, apps and documentation to help us.

## Features

* Manage cryptographic [keys](https://keys.pub/docs/specs/keys.html), [sigchains](https://keys.pub/docs/specs/sigchain.html)
and [user identities](https://keys.pub/docs/specs/user.html).
* [Search for keys](https://keys.pub/docs/restapi/user.html#get-user-search), verify and import them.
* Securely store passwords and secrets.
* [Encrypt, decrypt](https://keys.pub/docs/cli/encrypt.html), [sign, verify](https://keys.pub/docs/cli/sign.html)
(using [Saltpack](https://saltpack.org/)).
* Create a secure connection ([Wormhole](https://keys.pub/docs/specs/wormhole.html)) between 2 computers
(using [Noise](https://noiseprotocol.org/)).
* Most features are available in both the app and on the command line.
* 100% open source ([github.com/keys-pub](http://github.com/keys-pub)).

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@6524dd81768c37021fdcf6d6a0ab9b15243005aa/automatic/keys/screenshot.png)

## Notes

* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
