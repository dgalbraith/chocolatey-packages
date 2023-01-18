# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@368ae85553c5491c9c6867b0e1b3f02336389777/icons/gephi.png" width="48" height="48"/>Gephi - The Open Graph Viz Platform](https://chocolatey.org/packages/gephi)

[![Github License](https://img.shields.io/badge/Licenses-CDDL%201.0-blue.svg)](https://github.com/gephi/gephi/blob/master/cddl-1.0.txt)
[![Github license](https://img.shields.io/badge/GPLv3-blue.svg)](https://github.com/gephi/gephi/blob/master/gpl-3.0.txt)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v0.10.1-blue)](https://github.com/gephi/gephi/releases/tag/v0.10.1)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/gephi?label=Chocolatey)](https://chocolatey.org/packages/gephi)

Gephi is an interactive visualization and exploration platform for all kinds of networks and complex systems, dynamic
and hierarchical graphs.

Gephi is a tool for people that have to explore and understand graphs. Like Photoshop but for graphs, the user interacts
with the representation, manipulate the structures, shapes and colors to reveal hidden properties. The goal is to help
data analysts to make hypothesis, intuitively discover patterns, isolate structure singularities or faults during data
sourcing. It is a complementary tool to traditional statistics, as visual thinking with interactive interfaces is now
recognized to facilitate reasoning. This is software for [Exploratory Data Analysis](http://en.wikipedia.org/wiki/Exploratory_data_analysis),
a paradigm appeared in the [Visual Analytics](http://en.wikipedia.org/wiki/Visual_Analytics) field of research.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@368ae85553c5491c9c6867b0e1b3f02336389777/automatic/gephi/screenshot.png)

## Features

* **Fast** Powered by a built-in OpenGL engine, Gephi is able to push the envelope with very large networks. Visualize
networks up to a million elements. All actions (e.g. layout, filter, drag) run in real-time.
* **Simple** Easy to install and [get started](https://gephi.github.io/users/quick-start). A UI that is centered around
the visualization. Like Photoshop™ for graphs.
* **Modular** Extend Gephi with [plug-ins](https://gephi.org/plugins). The architecture is built on top of the Netbeans
Platform and can be extended or reused easily through well-written APIs.

## Package Parameters

If any package parameters are supplied no defaults will be used - only supplied parameters will be applied. The
following package parameter can be set:

* `/InstallDir`       -install Gephi to the specified folder.
* `/AddToDesktop`     - add a desktop shortcut
* `/AddToQuickLaunch` - add a quick launch shortcut
* `/AssociateGephi`   - add file association for Gephi Project files (.gephi)
* `/AssociateGexf`    - add file association for Graph Exchange XML Format files (.gexf)
* `/AssociateGdf`     - add file association for GUESS format GDF Graph files (.gdf)
* `/AssociateGraphml` - add file association for GraphML Graph files (.graphml)
* `/AssociateNet`     - add file association for Pajek NET Graph files (.net)
* `/CleanUserDir`     - clear user preferences from prior installs

eg. `choco install -y gephi --package-parameters="/InstallDir=C:\Tools\Gephi /AddToDesktop /AssociateGephi"`

To have Chocolatey remember parameters on upgrade, be sure to set `choco feature enable -n=useRememberedArgumentsForUpgrades`.

## Notes

* Requires an installation of Java 1.8+ to be available on the machine with `JDK_HOME` set to reflect the location.
* This location will be written to `etc\gephi.conf` located under the install directory and will not be updated if
  `JAVA_HOME` is subsequently modified
* If `JAVA_HOME` is modified the install can be updated by editing the configuration file `etc\gephi.conf` directly
  and updating the `jdkhome` setting to reflect or simply uninstalling and re-installing the Gephi package.
* The installer is a combined installer containing both 32 and 64-bit versions and will always install according to the
  bitness of the OS.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
