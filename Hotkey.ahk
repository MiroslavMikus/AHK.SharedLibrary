HotkeyWithDelegate(hk, fun, log, arg*) {
    Static funs := {}, logs := {}, args := {}
    funs[hk] := Func(fun), args[hk] := arg, logs[hk] := Func(log)
    Hotkey, %hk%, Hotkey_Handle_With_Delegate
    Return
Hotkey_Handle_With_Delegate:
    funs[A_ThisHotkey].(args[A_ThisHotkey]*)
    logs[A_ThisHotkey].(A_ThisHotkey)
    Return
}


Hotkey(hk, fun, arg*) {
    Static funs := {}, args := {}
    funs[hk] := Func(fun), args[hk] := arg
    Hotkey, %hk%, Hotkey_Handle
    Return
Hotkey_Handle:
    funs[A_ThisHotkey].(args[A_ThisHotkey]*)
    Return
}