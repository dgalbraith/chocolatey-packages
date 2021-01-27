# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@da67221b3b1b40c66454b28186f8b87c17118440/icons/cdex.png" width="48" height="48" />CDex](https://chocolatey.org/packages/cdex)

[![GitHub license](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://cdex.mu/license)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-2.24-blue.svg)](https://cdex.mu/sourcecode)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/cdex?label=Chocolatey)](https://chocolatey.org/packages/cdex)

CDex can extract the data directly (digital) from an Audio CD, which is generally called a CD Ripper or a CDDA utility.
The resulting audio file can be a plain WAV file (useful for making compilation audio CDs) or the ripped audio data can
be compressed using an audio encoder such as MP3, FLAC, AAC, WMA or OGG. Many encoders are supported, to name a few:

* Lame MP3 encoder 3.99.5 - MPEG Audio Layer III (.mp3)
* FLAC encoder 1.31 - Free Lossless Audio Codec (.flac)
* Ogg Vorbis encoder - Ogg 1.3.2 and Vorbis 1.3.4 (.ogg .oga)
* Monkey's Audio encoder - Lossless Audio(.ape)
* Microsoft WMA encoder - Windows Media Audio (.wma)
* Internal MP2 encoder - MPEG Audio Layer 2 (.mp2)
* Yamaha VQF encoder - TwinVQ (.vqf)
* Astrid / Quartex AAC encoder
* Psytel AAC encoder
* External Xing encoder
* WAV output encoder
* FAAC encoder - Freeware Advanced Audio Coder
* FAAD2 decoder
* Gogo-no-coda encoder
* External musepack encoder
* NTT VQF encoder
* Windows MP3 encoder (Fraunhofer MP3 encoder)
* Windows WMA8 encoder

In addition, WAV files on the hard drive can be converted to a Compressed Audio File (and vice versa). CDex also
supports many audio file tag formats like the ID3V1 and ID3V2 tags, which can be automatically inserted as part of the
ripping process.

## Features

* Direct recording of multiple tracks
* Read / store album information from/to the cdplayer.ini file
* Read / store album information from/to a local and/or remote CD Database (CDDB)
* Support CD-Text (if your CD-drive supports it)
* Advanced jitter correction (based on the cd-paranoia ripping library)
* Indicates track progress and jitter control
* Normalization of audio signal
* Supports many CD-Drive from many manufactures
* Conversion of external WAV files
* Support for M3U and PLS play list files
* Best of all, it's free (GPL license, source code available)

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@7b070932f6ddbe9cedbcb39dffd3176252e744da/automatic/cdex/screenshot.png)

## Notes

* Upon install completion the default browser will be launched on the page (https://cdex.mu/donate).
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
