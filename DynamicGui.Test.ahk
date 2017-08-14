#SingleInstance on

#include %A_ScriptDir%\DynamicGui.ahk

Title := "TabTitle"
Columns1 := ["first","second","third"]
Rows1 := [["RowContent1","RowContent2","RowContent3"]
         ,["RowContent4","RowContent5","RowConten6"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]
         ,["RowContent7","RowContent8","RowContent9"]]
MyTab := new GuiTab(Title,Columns1,Rows1)

Title2 := "TabTitleSecond"
Columns2 := ["firasdfst","sasdfecond","tasdfhird"]
Rows2 := [["RowContfgent1","RowCondfgtent2","RowdsfgContent3"]
         ,["RowContsdgfent4","RowCsdfgontent5","RowdsfgConten6"]
         ,["RowContsdfgent7","RowdfgContent8","RowCdfgontent9"]]
MyTab2 := new GuiTab(Title2,Columns2,Rows2)

new InfoGui("Amazing GUI","",[MyTab, MyTab2])