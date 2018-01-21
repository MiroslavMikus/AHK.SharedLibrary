BoolToString(a_Bool){
    if a_Bool
        return "True"
    return "False"
}

StringToBool(a_string){
    if a_string =
        return ""

    if a_string = 0
        return false

    if a_string = 1
        return true

    StringLower, result, a_string
    
    return InStr(a_string, "true")
}