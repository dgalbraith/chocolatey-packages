# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@b88007b58b05fbad5dfa762525117160741cd06a/icons/fluidsynth.png" width="48" height="48" />FluidSynth SoundFont Synthesizer](https://chocolatey.org/packages/fluidsynth)

[![Software license](https://img.shields.io/badge/License-LGPLv2.1-blue.svg)](https://github.com/FluidSynth/fluidsynth/blob/master/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v2.4.5-blue.svg)](https://github.com/FluidSynth/fluidsynth/releases/tag/v2.4.5)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/fluidsynth?label=Chocolatey)](https://chocolatey.org/packages/fluidsynth)

FluidSynth is a real-time software synthesizer based on the SoundFont 2 specifications and has reached widespread
distribution. FluidSynth itself does not have a graphical user interface, but due to its powerful API several
applications utilize it and it has even found its way onto embedded systems and is used in some mobile apps.

It can be used for live audio synthesis of MIDI events or for rendering MIDI files to disk, using SoundFont
instruments.

## Features

* SoundFont 2 support
* SoundFont 3 support (vorbis-compressed SF2)
* Realtime effect control using SoundFont 2.01 modulators
* Limited support for Downloadable Sounds (DLS) Level 1 & 2
* Playback of MIDI files
* Shared library which can be used in other programs
* Built in command line shell

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@b88007b58b05fbad5dfa762525117160741cd06a/automatic/fluidsynth/screenshot.png)

## Notes

* Package files are extracted to the `$env:ChocolateyToolsLocation` as determined by the `Get-ToolsLocation` function
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
