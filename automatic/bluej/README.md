# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ec1652f85e86682fba61efdbeb5a556dd6ad0284/icons/bluej.png" width="48" height="48"/>BlueJ - Beginners Java Development Environment](https://chocolatey.org/packages/bluej)

[![Software license](https://img.shields.io/badge/License-GPLv2-blue.svg)](https://www.bluej.org/about/LICENSE.txt)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v5.4.0-blue.svg)](https://www.bluej.org/index.html)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/bluej?label=Chocolatey)](https://chocolatey.org/packages/bluej)

BlueJ is a development environment that allows you to develop Java programs quickly and easily. Its main features are that it is:

* **Simple** BlueJ has a deliberately smaller and simpler interface than professional environments like NetBeans or Eclipse. This allows beginners to get started more quickly, and without being overwhelmed.
* **Designed** for teaching BlueJ is deliberately designed with good pedagogy in mind. There is a popular textbook designed for teaching introductory university/college courses with BlueJ, and a site full of teaching resources.
* **Interactive** BlueJ allows you to interact with objects. You can inspect their value, call methods on them, pass them as parameters and more. You can also directly invoke Java expressions without compiling. Thus BlueJ is a powerful graphical shell/REPL for Java.
* **Portable** BlueJ runs on Windows, Mac OS X, Linux and other platforms which run Java. It can also run without installation from a USB stick.
* **Mature** BlueJ is over fifteen years old, but continues to be updated and supported by a full-time team. We aim to respond to all technical support requests within one working day.
* **Innovative** BlueJ has several features not seen before in other IDEs. Its object bench, code pad, and scope colouring were all original BlueJ features.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@48b2855247b0e422e994f50e85b9bf8c8ca98c79/automatic/bluej/screenshot.png)

## Notes

* BlueJ requires a Java 11+ JDK which is bundled with the install.
* Current versions of BlueJ provide 64-bit support only - for a 32-bit operating system use [BlueJ 4.1.4](https://chocolatey.org/packages/bluej/4.1.4).
  
  ```powershell
  choco install bluej --version 4.1.4
  choco pin pin add -n=bluej --version 4.1.4
  ```

* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
