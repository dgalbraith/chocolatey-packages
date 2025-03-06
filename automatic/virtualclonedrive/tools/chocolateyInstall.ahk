SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 1   ;begins
DetectHiddenText, off
DetectHiddenWindows, off

; wait for the install process to commence
Process, Wait, SetupVirtualCloneDrive5530.exe

;install failure notification on Windows 8/Windows Server 2012 
;no impact to install but the dialog needs to be dismissed
WinWait, Virtual CloneDrive, Installation failed!, 30
ControlClick, Button1, Virtual CloneDrive

;reboot prompt on Windows 8/Windows Server 2012 despite /noreboot option
;dismiss reboot prompt with no action for silent install matching expectations
WinWait, VirtualCloneDrive Setup, Your computer needs to be restarted. Reboot now?, 30
ControlClick, Button2, VirtualCloneDrive Setup

Exit
