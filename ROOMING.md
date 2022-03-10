# CODE-LIBRARY

```SQL
Sub ALL_MACROS()

Sheets.Add(Before:=Sheets("MIAS")).Name = "TEMP"
Sheets("TEMP").Paste

Application.CommandBars("Queries and Connections").Visible = True
Application.ScreenUpdating = False
Application.DisplayAlerts = False
Application.EnableEvents = False
Application.Calculation = xlAutomatic

Call ConnectionActive

Call PasteValues

Call SORT

Call FORMULA

Call SAVE

Application.ScreenUpdating = True
Application.DisplayAlerts = True
Application.EnableEvents = True
Application.Calculation = xlAutomatic

End Sub
```

```SQL
Sub ConnectionActive()

Dim Connection As Variant

    For Each Connection In ActiveWorkbook.Connections
    
        Connection.OLEDBConnection.BackgroundQuery = False
        
    Next Connection

End Sub
```

```SQL
Sub ClearData()
 
ActiveWorkbook.Sheets("MIAS").Range("A3:AH1000").Clear
ActiveWorkbook.Sheets("MIAS").ListObjects("MIAS").Resize Range("$A$2:$AH$3")

End Sub

Sub ClearOnly()

Application.CommandBars("Queries and Connections").Visible = True
ActiveWorkbook.Sheets("MIAS").Range("A3:AH1000").Clear
ActiveWorkbook.Sheets("MIAS").ListObjects("MIAS").Resize Range("$A$2:$AH$3")
ActiveWorkbook.Sheets("MIAS").Range("A2").Select
ActiveWorkbook.RefreshAll

End Sub
```SQL

```SQL
Sub PasteValues()

Sheets("TEMP").UsedRange.Copy Destination:=Sheets("MIAS").Range("e3")
Sheets("TEMP").Delete

End Sub
```

```SQL
Sub SORT()
 
    Sheets("MIAS").Select
    Range("A3:A" & Cells(Rows.Count, "A").End(xlUp).Row).FORMULA = "=[@[ROOMING LIST]]&"" ""&[@Room]"
    Range("B3:B" & Cells(Rows.Count, "B").End(xlUp).Row).FORMULA = "=IFERROR(TEXT([@[Check in]],""DD-MM-YY"")&"" ""&TEXT([@[Flight number]],""00000"")&"" ""&VLOOKUP([@Hotel],HOTELS,2,0),"""")"
    Range("C3:C" & Cells(Rows.Count, "C").End(xlUp).Row).FORMULA = "=SUMPRODUCT(1/COUNTIF($B$3:B3,$B$3:B3))"
    Range("D3:D" & Cells(Rows.Count, "D").End(xlUp).Row).FORMULA = "=SUMPRODUCT(1/COUNTIF($A$3:A3,A$3:A3))"

    Cells.Select

    With Selection
        .HorizontalAlignment = xlLeft
        .VerticalAlignment = xlTop

    End With

    ActiveWorkbook.Worksheets("MIAS").ListObjects("MIAS").SORT.SortFields.Clear
    
    ActiveWorkbook.Worksheets("MIAS").ListObjects("MIAS").SORT.SortFields.Add2 Key _
        :=Range("MIAS[ROOMING LIST BY ROOM]"), SortOn:=xlSortOnValues, Order:= _
        xlAscending, DataOption:=xlSortNormal
    
    ActiveWorkbook.Worksheets("MIAS").ListObjects("MIAS").SORT.SortFields.Add2 Key _
        :=Range("MIAS[Flight number]"), SortOn:=xlSortOnValues, Order:=xlAscending _
        , DataOption:=xlSortNormal
        
    ActiveWorkbook.Worksheets("MIAS").ListObjects("MIAS").SORT.SortFields.Add2 Key _
        :=Range("MIAS[Hotel]"), SortOn:=xlSortOnValues, Order:=xlAscending, _
        DataOption:=xlSortNormal
        
    ActiveWorkbook.Worksheets("MIAS").ListObjects("MIAS").SORT.SortFields.Add2 Key _
        :=Range("MIAS[Group count]"), SortOn:=xlSortOnValues, Order:=xlAscending, _
        DataOption:=xlSortNormal
        
    ActiveWorkbook.Worksheets("MIAS").ListObjects("MIAS").SORT.SortFields.Add2 Key _
        :=Range("MIAS[Group reference]"), SortOn:=xlSortOnValues, Order:= _
        xlAscending, DataOption:=xlSortNormal
        
    With ActiveWorkbook.Worksheets("MIAS").ListObjects("MIAS").SORT
        .Header = xlYes
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With
    
End Sub
```

```SQL
Sub FORMULA()

ActiveWorkbook.RefreshAll

Dim WS As Worksheet

For Each WS In ThisWorkbook.Worksheets

    If WS.Name <> "MIAS" Then
        
        WS.Activate
        WS.Range("A2:A" & Cells(Rows.Count, "A").End(xlUp).Row).FORMULA = "=SUMPRODUCT(1/COUNTIF($Y$2:Y2,$Y$2:Y2))"
        WS.Range("B2:B" & Cells(Rows.Count, "B").End(xlUp).Row).FORMULA = "=SUMPRODUCT(1/COUNTIF($AA$2:AA2,$AA$2:AA2))"
        WS.Outline.ShowLevels ColumnLevels:=1
        WS.Range("A1").Select
               
    End If
 
Next

' Sheets("MIAS").Select

End Sub
```

```SQL
Sub SAVE()

Dim WS As Worksheet
Dim FolderName As String

FolderName = "C:\LOCAL DATA\ROOMING\"

For Each WS In ThisWorkbook.Worksheets

    If WS.Name <> "MIAS" Then
        
        WS.Copy
        
        On Error Resume Next
        
        ActiveSheet.Name = Range("F2").Value
        ActiveSheet.SaveAs (FolderName & Range("Z2").Value)
        ActiveWorkbook.Close
        
        On Error GoTo ErrorOut
             
ErrorOut:
        
    End If
 
Next

Sheets("MIAS").Select

MsgBox "FILES SAVED TO " & FolderName

End Sub
```

```SQL
Sub Fixing()

Application.ScreenUpdating = True
Application.DisplayAlerts = True
Application.EnableEvents = True

End Sub
```

POWER QUERY REMOVE INVALID COLUMNS
```SQL
let
    Source = Excel.CurrentWorkbook(){[Name="SHEET1"]}[Content],
    #"Removed Other Columns" = Table.SelectColumns(Source,{"ROOMING INDEX", "ROOMING INDEX BY ROOM", "Booking id", "Hotel", "Room", "Room type", "Check in", "Check out", "Accessibility", "First name", "Last name", "Date of birth", "Group reference", "Flight number", "Email", "Phone", "Primary contact", "Unaccompanied minor", "Dietary requirements", "Group count", "Adjoining room", "Special requirements", "Speak english", "Languages spoken", "Other language", "Group id","ROOMING LIST BY ROOM", "ROOMING LIST"}),
    #"Filtered Rows" = Table.SelectRows(#"Removed Other Columns", each ([Booking id] <> " "))
in
    #"Filtered Rows"
```

POWER QUERY REFERENCE TABLE AND COUNT
```SQL
let
    Source = Excel.CurrentWorkbook(){[Name="SHEET1"]}[Content],
    #"Removed Duplicates" = Table.Distinct(Source, {"ROOMING LIST"}),
    #"Removed Other Columns" = Table.SelectColumns(#"Removed Duplicates",{"ROOMING INDEX", "ROOMING LIST", "Flight number"}),
    #"Changed Type" = Table.TransformColumnTypes(#"Removed Other Columns",{{"ROOMING LIST", type text}, {"Flight number", type text}}),
    #"Added Custom" = Table.AddColumn(#"Changed Type", "LEN", each Text.Length([ROOMING LIST])),
    #"Sorted Rows" = Table.Sort(#"Added Custom",{{"LEN", Order.Descending}})
in
    #"Sorted Rows"
```
POWER QUERY FILTER BY REFERENCE COUNT
```SQL
let
    Source = #"SHEET1",
    #"Changed Type" = Table.TransformColumnTypes(Source,{{"ROOMING INDEX", Int64.Type}}),
    #"Filtered Rows" = Table.SelectRows(#"Changed Type", each ([ROOMING INDEX] = 1)),
    #"Sorted Rows" = Table.Sort(#"Filtered Rows",{{"Group count", Order.Ascending},{"Group reference", Order.Ascending}, {"Room", Order.Ascending}}),
    #"Added Index" = Table.AddIndexColumn(#"Sorted Rows", "PAX", 1, 1, Int64.Type),
    #"Removed Columns" = Table.RemoveColumns(#"Added Index",{"ROOMING INDEX", "Booking id", "Room", "ROOMING INDEX BY ROOM"}),
    #"Reordered Columns" = Table.ReorderColumns(#"Removed Columns",{"PAX", "Hotel", "Room type", "Check in", "Check out", "First name", "Last name", "Date of birth", "Group count", "Adjoining room", "Accessibility", "Special requirements", "Dietary requirements", "Group reference", "Flight number", "Unaccompanied minor", "Speak english", "Languages spoken", "Other language", "Email", "Phone", "Primary contact", "Group id", "ROOMING LIST", "ROOMING LIST BY ROOM"}),
    #"Add blank" = if Table.IsEmpty(#"Reordered Columns") = true then Table.InsertRows(#"Reordered Columns", 0,{Record.FromList(List.Repeat({""},Table.ColumnCount(#"Reordered Columns")),Table.ColumnNames(#"Reordered Columns"))}) else #"Reordered Columns"
in
    #"Add blank"
```
###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)

-------------------------
