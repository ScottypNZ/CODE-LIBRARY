# CODE-LIBRARY

* [MIAS_LOOP](#MIAS-LOOP)

=====================

### MIAS LOOP

```VBA

Sub ClearData()
 
    Range("a4", "ah100000").Clear
    ActiveSheet.ListObjects("MIAS").Resize Range("$A$2:$AH$3")

End Sub

Sub SORT_AND_REFRESH()

    Application.ScreenUpdating = False
    Application.DisplayAlerts = False
    Application.Calculation = xlAutomatic
    Application.CommandBars("Queries and Connections").Visible = True
        
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
    
    ActiveWorkbook.RefreshAll
    
    Application.ScreenUpdating = True
    Application.DisplayAlerts = True

End Sub

Sub FORMULA_AND_SAVE()

Application.ScreenUpdating = False
Application.DisplayAlerts = False
Application.EnableEvents = False

Dim WS As Worksheet
Dim SheetName As String
Dim FolderName As String
Dim lRow As Long

FolderName = "C:\LOCAL DATA\ROOMING\"

For Each WS In ThisWorkbook.Worksheets

    If WS.Name <> "MIAS" Then
    
       ' Application.DisplayAlerts = False
    
        WS.Activate
        WS.Range("A2:A" & Cells(Rows.Count, "A").End(xlUp).Row).FORMULA = "=SUMPRODUCT(1/COUNTIF($Y$2:Y2,$Y$2:Y2))"
        WS.Range("B2:B" & Cells(Rows.Count, "B").End(xlUp).Row).FORMULA = "=SUMPRODUCT(1/COUNTIF($AA$2:AA2,$AA$2:AA2))"
        WS.Columns("A:A").Group
        WS.Columns("Z:AA").Group
        WS.Outline.ShowLevels ColumnLevels:=1
        WS.Copy
        
        On Error Resume Next
        
        ActiveSheet.Name = Range("F2").Value
        ActiveSheet.SaveAs (FolderName & Range("Z2").Value)
        ActiveWorkbook.Close
        
        On Error GoTo ErrorOut
             
ErrorOut:
        
    End If
 
Next

MsgBox "FILES SAVED TO " & FolderName

Application.ScreenUpdating = True
Application.DisplayAlerts = True
Application.EnableEvents = True
Application.Calculation = xlAutomatic

End Sub

Sub fixing()

Application.ScreenUpdating = True
Application.DisplayAlerts = True
wb.DisplayAlerts = True

End Sub

```
###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------