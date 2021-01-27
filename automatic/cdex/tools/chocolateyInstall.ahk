#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 1   ;begins
DetectHiddenText, off
DetectHiddenWindows, off

;donations
WinWait, CDex Setup, Thank You for using CDex!
ControlClick, Button1, CDex Setup

Exit
