ReadFromUninstall(a_DisplayName, a_Attribute)
{
	ReadRegisterKey("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall", a_DisplayName,a_Attribute)
}

ReadRegisterKey(a_RegisterKey, a_DisplayName, a_Attribute)
{
	result := "NotFound"
	Loop HKLM, %a_RegisterKey%, 2
	{
		RegRead currentName, HKLM, %UninstallKey%\%A_LoopRegName%, DisplayName
		if InStr(currentName, a_DisplayName, false)
		{
			RegRead result, HKLM, %UninstallKey%\%A_LoopRegName%, %a_Attribute%
			If ErrorLevel
			{
				result := "ReadRegister error"
			}
			break
		}
	}
	return result
}