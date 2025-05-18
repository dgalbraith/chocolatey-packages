MaxWaitTime := 60000  ; Maximum wait time in milliseconds (e.g., 30000 ms = 30 seconds)
StartTime := A_TickCount  ; Record the start time

SetTimer(CheckProcess, 250)  ; Check every 250 milliseconds
return

CheckProcess() {
    pid := ProcessExist("OpenWith.exe")  ; Check if the process exists
    if pid {  ; If the process exists, `pid` contains its PID
        ProcessClose(pid)  ; Kill the process
        ExitApp  ; Exit the script
    }
    ; Check if the maximum wait time has elapsed
    if (A_TickCount - StartTime > MaxWaitTime) {
        ExitApp  ; Exit the script
    }
}
 