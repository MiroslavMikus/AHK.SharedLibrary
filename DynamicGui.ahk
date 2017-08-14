Class InfoGui{
    MyTabs := ""
    GuiTitle := ""
    MyPosition :=""

	__New(a_Title, a_Position, a_GuiTabs){
		this.GuiTitle := a_Title
        this.MyTabs := a_GuiTabs
        this.MyPosition := a_Position
        Gui, Destroy 
        ; if is some GUI there - this will close it first (only in same thread)
        this.CreateGui()
	}

    CreateGui(){

        ; Buttons
        Gui, Add, Button, gClose x510 y360 w120 h30 , &Close
        Gui, Add, Button, gCloseScript x375 y360 w120 h30 , Close Script
        Gui, Add, Button, gRestartScript x240 y360 w120 h30 , Restart Script

        ; AHK link
        Gui, Add, Link, y366 x15 , Created by <a href="www.github.com/miroslavmikus">Miroslav Mikus</a> with <a href="www.autohotkey.com">Auto Hot Key</a>

        ;  Create all tabs headers
        allTabs := ""
        Loop % this.MyTabs.MaxIndex(){
            allTabs := allTabs . "|" . this.MyTabs[A_Index].TabName
        }
        StringTrimLeft, allTabs, allTabs, 1
        Gui, Add, Tab,x0 y0 w650 h350, % allTabs

        ; Fill Tabs with grid and content
        Loop % this.MyTabs.MaxIndex(){
            Header := this.CreateHeader(this.MyTabs[A_Index].Columns)
            Gui, Tab, % A_Index
            Gui, Add, ListView, x0 y20 w650 h330, % Header
            this.AddRow(this.MyTabs[A_Index].Rows)
            LV_ModifyCol()    
        }

        this.CalculateSizePosition()

        Hotkey, esc, Close, on
        Gui, Show, % this.MyPosition, % this.GuiTitle
        return	

        Close:
        GuiClose:
            Hotkey, esc, Close ,delete
            Gui, Destroy
        return
        CloseScript:
        exitapp
        return
        RestartScript:
            Reload
        return
    }

    CalculateSizePosition(){
        Size := "w650 h400"
        If this.MyPosition = ""
            this.MyPosition := Size
        else
            this.MyPosition := this.MyPosition . " " . Size
    }

    CreateHeader(a_array){      
        allTabs := ""
        Loop % a_array.MaxIndex()
            allTabs := allTabs . "|" . a_array[A_Index]
        StringTrimLeft, allTabs, allTabs, 1
        return allTabs
    }

    AddRow(a_rows){ ; take one array [["",""],["",""]]
        arrayLength := a_rows[1].MaxIndex()        
        if arrayLength = 1
            Loop % a_rows.MaxIndex()
                LV_Add("" , a_rows[A_Index][1])
        else if arrayLength = 2
            Loop % a_rows.MaxIndex()
                LV_Add("" , a_rows[A_Index][1] , a_rows[A_Index][2])
        else if arrayLength = 3
            Loop % a_rows.MaxIndex()
                LV_Add("" , a_rows[A_Index][1] , a_rows[A_Index][2] , a_rows[A_Index][3])
        else if arrayLength = 4
            Loop % a_rows.MaxIndex()
                LV_Add("" , a_rows[A_Index][1] , a_rows[A_Index][2], a_rows[A_Index][3], a_rows[A_Index][4])
    }

}

class GuiTab{
    TabName :=""
    Columns :=""
    Rows :=""

    __New(a_name, a_columns, a_rows){
        this.TabName := a_name
        this.Columns := a_columns
        this.Rows := a_rows
    }
}