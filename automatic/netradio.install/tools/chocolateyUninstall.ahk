MaxWaitTime := 60000  ; Maximum wait time in milliseconds (e.g., 30000 ms = 30 seconds)
WinTitle := "Uninstall ahk_class #32770 ahk_exe _unins.tmp"
ButtonText := "&Yes"

StartTime := A_TickCount  ; Record the start time

Loop {
    ; Wait for the window to appear
    if WinExist(WinTitle) {
        hwnd := WinGetID(WinTitle)
        ; Ensure the window is active
        WinActivate(hwnd)
        ; Find the button with the specified text
        for ctrl in WinGetControls(hwnd) {
            if (ControlGetText(ctrl, hwnd) = ButtonText) {
                ControlClick(ctrl, hwnd)
                ExitApp
            }
        }
    }
    Sleep 250
    if (A_TickCount - StartTime > MaxWaitTime)
        ExitApp
}
