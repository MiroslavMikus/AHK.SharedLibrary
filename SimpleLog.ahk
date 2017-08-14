LogToTray(a_title, a_message, a_class, a_timeout := 5){ 
    trayOption := 0
    if InStr(a_class, "info", false)
        trayOption := 1
    else if InStr(a_class, "warning", false)
        trayOption := 2
    else if InStr(a_class, "error", false)
        trayOption := 3
    else
        TrayTip, % a_title, % a_message, % a_timeout
    TrayTip, % a_title, % a_message, % a_timeout, % trayOption
}

LogToMsg(a_title, a_message, a_class, a_timeout := 0){
    msgOption := 0
    if InStr(a_class, "info", false)
        msgOption := 64
    else if InStr(a_class, "warning", false)
        msgOption := 48
    else if InStr(a_class, "error", false)
        msgOption := 16

    if a_timeout = 0
        MsgBox, % msgOption, % a_title, % a_message
    else
        MsgBox, % msgOption, % a_title, % a_message, % a_timeout
}

LogToFile(a_title, a_message, a_class, a_FileName := "ahkLog.txt"){
    FormatTime, MyDate, , yyyy-MM-dd HH:mm:ss
    TextToWrite := % MyDate . "@" . computername . "@" . a_class . "@" . a_title . "@" . a_message . "`n"
    loop, 3
    {
        try
        {
            FileAppend, %TextToWrite%, % a_FileName
            return
        }
        catch e
        {
            ; eat exception
        }
        random, sleepTime, 500, 1000
        sleep, %sleepTime%
    }
}