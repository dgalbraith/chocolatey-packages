# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@024a0e31a291ceea63f7af5e63e2679403c5aa8f/icons/sysinternals.png" width="48" height="48" />LiveKd - Windows Sysinternals](https://chocolatey.org/packages/livekd)

[![Software License](https://img.shields.io/badge/License-Proprietary-grey.svg)](https://docs.microsoft.com/en-us/sysinternals/license-terms)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v5.4-blue)](https://docs.microsoft.com/sysinternals/downloads/livekd)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/livekd?label=Chocolatey)](https://chocolatey.org/packages/livekd)

Run the Kd and Windbg Microsoft kernel debuggers, which are part of the [Debugging Tools for Windows package](https://www.microsoft.com/whdc/devtools/debugging/default.mspx),
locally on a live system. Execute all the debugger commands that work on crash dump files to look deep inside the
system. See the [Debugging Tools for Windows](https://docs.microsoft.com/windows-hardware/drivers/debugger)
documentation and the [Windows Internals Book](https://docs.microsoft.com/sysinternals/resources/windows-internals)
for information on how to explore a system with the kernel debuggers.

While the latest versions of Windbg and Kd have a similar capability on Windows Vista and Server 2008, LiveKD enables
more functionality, such as viewing thread stacks with the !thread command, than Windbg and Kd's own live kernel
debugging facility.

Usage:<br>
`liveKd [[-w]|[-k <debugger>]|[-o filename]] [-vsym] [-m[flags] [[-mp process]|[pid]]][debugger options]`<br>
`liveKd [[-w]|[-k <debugger>]|[-o filename]] -ml [debugger options]`<br>
`liveKd [[-w]|[-k <debugger>]|[-o filename]] [[-hl]|[-hv <VM name> [[-p]|[-hvd]]]] [debugger options]`

Parameter | Description
:--------:|------------
-hv       | Specifies the name or GUID of the Hyper-V VM to debug.
-hvd      | Includes hypervisor pages (Windows 8.1 and above only).
-hvl      | Lists the names and GUIDs of running Hyper-V VMs.
-k        | Specifies complete path and filename of debugger image to execute
-m        | Creates a mirror dump, which is a consistent view of kernel memory. Only kernel mode memory will be available, and this option may need significant amounts of available physical memory.  A flags mask that specifies which regions to include may optionally be provided (drawn from the following table, default 0x18F8):<ul style="margin-left: 20px"><br><li>0001 - process private<br><li>0002 - mapped file<br><li>0004 - shared section<br><li>0008 - page table pages<br><li>0010 - paged pool<br><li>0020 - non-paged pool<br><li>0040 - system PTEs<br><li>0080 - session pages<br><li>0100 - metadata files<br><li>0200 - AWE user pages<br><li>0400 - driver pages<br><li>0800 - kernel stacks<br><li>1000 - WS metadata<br><li>2000 - large pages</ul><br>The default captures most kernel memory contents and is recommended.  This option may be used with `-o` to save faster, consistent dumps.  Mirror dumps require Windows Vista or Windows Server 2008 or above.  Sysinternals RamMap provides a graphical summary of the distribution of the available memory regions that can be selected for inclusion.
-ml       | Generate live dump using native support (Windows 8.1 and above only).
-mp       | Specifies a single process whose user mode memory contents should be included in a mirror dump. Only effective with the `-m` option.
-o        | Saves a memory.dmp to disk instead of launching the debugger.
-p        | Pauses the target Hyper-V VM while LiveKd is active (recommended for use with -o).
-n        | Specifies the name or GUID of the Hyper-V VM to debug.
-hvl      | Lists the names and GUIDs of running Hyper-V VMs.
-vsym     |  Displays verbose debugging information about symbol load operations.
-w        |  Runs windbg instead of kd.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ab7733d9bd5714cac138fe9e5eec447633fb3d75/automatic/livekd/screenshot.png)

## Notes

* Requires an installation of [Debugging Tools for Windows](https://docs.microsoft.com/windows-hardware/drivers/debugger) to function
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
