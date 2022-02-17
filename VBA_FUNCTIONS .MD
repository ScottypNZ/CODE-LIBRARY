VBA Library
=====================

### INDEX
--------
 * [DISABLE BACKGROUND CONNECTIONS](#DISABLE-BACKGROUND-CONNECTIONS)
 * [CHANGE CASE](#CHANGE-CASE) 
 * [CONVERT NUMBERS TO WORDS](#CHANGE-CASE)
 * [COPY DOWN VISIBLE](#COPY-DOWN-VISIBLE)
 * [LIST FILES](#LIST-FILES)
 * [RENAME FILES](#RENAME-FILES)
 * [INDEX PAGE WITH HYERLINK](#INDEX-PAGE-WITH-HYERLINK)
 * [INDEX WITH HYERLINK TABLES](#INDEX-WITH-HYERLINK-TABLES)
 * [CREATE TABLES](#CREATE-TABLES)
 * [SAVESHEETS](#SAVESHEETS)
 * [REMOVE CHARACTERS CASE](#REMOVE-CHARACTERS-CASE)
 * [REMOVE CHARACTERS LIKE](#REMOVE-CHARACTERS-LIKE)
 * [FILTER DATA VIA POWER QUERY AND SAVE AS SEPERATE SHEET](#FILTER-DATA-VIA-POWER-QUERY-AND-SAVE-AS-SEPERATE-SHEET)
 * [ROOMING](#ROOMING)

-------------------------

### DISABLE BACKGROUND CONNECTIONS

```vbA
Sub ConnectionActive()
Dim Connection As Variant
    For Each Connection In ActiveWorkbook.Connections
         Connection.OLEDBConnection.BackgroundQuery = False
    Next Connection
End Sub
```
###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)

### COPY DOWN VISIBLE 

<p style="font-size;6pt">
    COPY VALUES TO BOTTOM OF A TABLE WHEN FILTER ACTIVE
</p>

```vb
Sub COPY_FILTERED_DOWN()
Selection.Copy
Range(Selection, Selection.End(xlDown)).Select
Selection.SpecialCells(xlCellTypeVisible).Select
Selection.PasteSpecial Paste:=xlPasteValues
End Sub
```
###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------
### CHANGE CASE 
```VB
Sub Uppercase()
For Each x In Range("A1:A5")
x.Value = UCase(x.value)
Next
End Sub
```
```VB
Sub Lowercase()
For Each x In Range("B1:B5")
x.Value = LCase(x.Value)
Next
End Sub
```
```VB
Sub Proper_Case()
For Each x In Range("C1:C5")
x.Value = Application.Proper(x.Value)
Next
End Sub
```
###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------
### LIST FILES

```VB
Sub LIST()
Dim objFSO As Object
Dim objFolder As Object
Dim objFile As Object
Dim i As Integer
Set objFSO = CreateObject("Scripting.FileSystemObject")
'''Set objFolder = objFSO.GetFolder(Subfolder.path)'''
Set objFolder = objFSO.GetFolder("C:\LOCAL DATA\MIAS")
i = 1
Cells(1, 1) = "FOLDER"
Cells(1, 2) = "FILE"
Cells(1, 3) = "PATH"
For Each objFile In objFolder.Files
Cells(i + 1, 1) = objFolder.path
Cells(i + 1, 2) = objFile.Name
Cells(i + 1, 3) = objFile.path
i = i + 1
Next objFile
End Sub
```

### ALTERNATIVE

```VB
Sub LoopAllFilesInAFolder()

Dim fileName As Variant
Dim wb As Workbook
fileName = Dir("C:\LOCAL DATA\MIAS\DATA\")

While fileName <> ""
    
    Debug.Print fileName

    fileName = Dir
    
Wend

End Sub
```

###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)

### RENAME FILES

```VB
Sub ReName()
Dim rFiles As Range, rCell As Range
Dim StrNewName As String, strOld As String
Dim strPath As String
Dim wbOpen As Workbook
 Application.ScreenUpdating = False
  Set rFiles = Range("A1", Range("A65536").End(xlUp))
 strPath = ActiveWorkbook.path & "\"
 For Each rCell In rFiles
 strOld = strPath & rCell
 StrNewName = rCell(1, 2)
 Set wbOpen = Workbooks.Open(strOld)
 wbOpen.SaveAs strPath & StrNewName
 wbOpen.Close
 Next rCell
  Application.ScreenUpdating = True
End Sub
```

###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------

### CONVERT NUMBERS TO WORDS

```VB
Option Explicit
'Main Function
Function SpellNumber(ByVal MyNumber)
Dim Dollars, Cents, Temp
Dim DecimalPlace, Count
ReDim Place(9) As String
Place(2) = " Thousand "
Place(3) = " Million "
Place(4) = " Billion "
Place(5) = " Trillion "
' String representation of amount.
MyNumber = Trim(Str(MyNumber))
' Position of decimal place 0 if none.
DecimalPlace = InStr(MyNumber, ".")
' Convert cents and set MyNumber to dollar amount.
If DecimalPlace > 0 Then
Cents = GetTens(Left(Mid(MyNumber, DecimalPlace + 1) & _ "00", 2))
MyNumber = Trim(Left(MyNumber, DecimalPlace - 1))
End If
Count = 1
Do While MyNumber <> ""
Temp = GetHundreds(Right(MyNumber, 3))
If Temp <> "" Then Dollars = Temp & Place(Count) & Dollars
If Len(MyNumber) > 3 Then
MyNumber = Left(MyNumber, Len(MyNumber) - 3)
Else
MyNumber = ""
End If
Count = Count + 1
Loop
Select Case Dollars
Case ""
Dollars = "No Dollars"
Case "One"
Dollars = "One Dollar"
Case Else
Dollars = Dollars & " Dollars"
End Select
Select Case Cents
Case ""
Cents = " and No Cents"
Case "One"
Cents = " and One Cent"
Case Else
Cents = " and " & Cents & " Cents"
End Select
SpellNumber = Dollars & Cents
End Function
' Converts a number from 100-999 into text
Function GetHundreds(ByVal MyNumber)
Dim Result As String
If Val(MyNumber) = 0 Then Exit Function
MyNumber = Right("000" & MyNumber, 3)
' Convert the hundreds place.
If Mid(MyNumber, 1, 1) <> "0" Then
Result = GetDigit(Mid(MyNumber, 1, 1)) & " Hundred "
End If
' Convert the tens and ones place.
If Mid(MyNumber, 2, 1) <> "0" Then
Result = Result & GetTens(Mid(MyNumber, 2))
Else
Result = Result & GetDigit(Mid(MyNumber, 3))
End If
GetHundreds = Result
End Function
' Converts a number from 10 to 99 into text.
Function GetTens(TensText)
Dim Result As String
Result = "" ' Null out the temporary function value.
If Val(Left(TensText, 1)) = 1 Then ' If value between 10-19...
Select Case Val(TensText)
Case 10: Result = "Ten"
Case 11: Result = "Eleven"
Case 12: Result = "Twelve"
Case 13: Result = "Thirteen"
Case 14: Result = "Fourteen"
Case 15: Result = "Fifteen"
Case 16: Result = "Sixteen"
Case 17: Result = "Seventeen"
Case 18: Result = "Eighteen"
Case 19: Result = "Nineteen"
Case Else
End Select
Else ' If value between 20-99...
Select Case Val(Left(TensText, 1))
Case 2: Result = "Twenty "
Case 3: Result = "Thirty "
Case 4: Result = "Forty "
Case 5: Result = "Fifty "
Case 6: Result = "Sixty "
Case 7: Result = "Seventy "
Case 8: Result = "Eighty "
Case 9: Result = "Ninety "
Case Else
End Select
Result = Result & GetDigit _
(Right(TensText, 1)) ' Retrieve ones place.
End If
GetTens = Result
End Function
' Converts a number from 1 to 9 into text.
Function GetDigit(Digit)
Select Case Val(Digit)
Case 1: GetDigit = "One"
Case 2: GetDigit = "Two"
Case 3: GetDigit = "Three"
Case 4: GetDigit = "Four"
Case 5: GetDigit = "Five"
Case 6: GetDigit = "Six"
Case 7: GetDigit = "Seven"
Case 8: GetDigit = "Eight"
Case 9: GetDigit = "Nine"
Case Else: GetDigit = ""
End Select
End Function
```
###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------

### INDEX PAGE WITH HYERLINK

```VB
Private Sub Worksheet_Activate()
Dim wSheet As Worksheet
Dim l As Long
l = 1
With Me
.Columns(1).ClearContents
.Cells(1, 1) = “INDEX”
.Cells(1, 1).Name = “Index”
End With
For Each wSheet In Worksheets
If wSheet.Name <> Me.Name Then
l = l + 1
With wSheet
.Range(“A1”).Name = “Start_” & wSheet.Index
.Hyperlinks.Add Anchor:=.Range(“A1″), Address:=””, _
SubAddress:=”Index”, TextToDisplay:=”Back to Index”
End With
Me.Hyperlinks.Add Anchor:=Me.Cells(l, 1), Address:=””, _
SubAddress:=”Start_” & wSheet.Index, TextToDisplay:=wSheet.Name
End If
Next wSheet
End Sub
```

###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------
### INDEX WITH HYERLINK TABLES

```VB
Private Sub Worksheet_Activate()
 
' macro written by Doug Wilson, June 26, 2020
'
' this code calls the "Create_Index" macro every time the worksheet "Index" is selected/activated
' this ensures the Workbook Index is always current when viewed
 
Call Create_Index
 
End Sub
'
 
Sub Create_Index()
 
' macro written by Doug Wilson, June 26, 2020
 
' this macro is called when the worksheet "Index" is selected
' the following code creates a list of all the sheets in the workbook with hyperlinks to each
 
Dim x As Integer
Dim Nm1, Nm2 As String
Dim place As Integer
Dim ws As Worksheet
Dim SA, TTD As Variant
 
Application.ScreenUpdating = False     ' allows macro to run faster - helpful with large workbooks
 
Const bSkipHidden As Boolean = False    'Change this to True to NOT list hidden sheets
 
place = 4     ' the row number where the sheet info is entered to on the "Index worksheet
x = 1           ' used as a reference to the sheet's order number from left to right in the workbook
 
Sheets("Index").Cells.Clear     ' Clear all data in cells
 
' edit: alignment, height, font & size to suit your needs
Columns("B:D").Select
    With Selection
        .EntireColumn.Hidden = False     ' un-hides column 'C' - sheet code name data
        .HorizontalAlignment = xlCenter
        .RowHeight = 15
        .Font.Name = "Arial"
        .Font.Size = 12
         End With
        
Sheets("Index").Range("A1").Select
    With Selection
        .Value = ActiveWorkbook.Name & "   ~   Table of Contents"     ' inserts a title at top of sheet; edit to suit
        .RowHeight = 20
        .Font.Name = "Arial"
        .Font.Size = 16
        End With
 
Sheets("Index").Range("B3:D3").Borders(xlEdgeBottom).Weight = xlMedium
 
Sheets("Index").Range("B3") = "Sheet #"
Sheets("Index").Range("C3") = "Sheet Code Name"
Sheets("Index").Range("D3") = "Sheet Tab Name"
Sheets("Index").Range("B3:D3").Select      ' header row
' edit: height, font & size to suit your needs
    With Selection
    Selection.RowHeight = 20
        .Font.Name = "Arial"
        .Font.Size = 14
        End With
        Range("A1").Select
        
For Each ws In Worksheets     ' start the loop through all worksheets
 
Nm1 = ws.CodeName     ' the worksheet code name (first line in Properties pane)
Nm2 = ws.Name            ' the worksheet Tab name (as seen across the bottom of the workbook)
 
SA = "'" & Worksheets(Nm2).Name & "'!" & "A1"     ' the 'SubAddress' used in the hyperlink code
TTD = Nm2     ' the 'TextToDisplay' used in the hyperlink code
 
Sheets("Index").Cells(place, 2) = x         ' enters the sheet's order number on the Index sheet
Sheets("Index").Cells(place, 3) = Nm1    ' enters the sheet's code name on the Index sheet
Sheets("Index").Cells(place, 4) = Nm2    ' enters the sheet's Tab name on the Index sheet
Sheets("Index").Range(Cells(place, 2), Cells(place, 4)).Select
    Selection.RowHeight = 15
    Range("A1").Select
If Nm2 = "Index" Then GoTo Line100    ' if the sheet name is Index, skip adding a hyperlink
Sheets("Index").Cells(place, 4).Select      ' selects the cell where the hyperlink will be added
ActiveCell.Hyperlinks.Add Anchor:=Selection, Address:="", SubAddress:=SA, TextToDisplay:=TTD
With Selection.Font      ' set the font type and size of hyperlink to match the other data; edit to suit
        .Name = "Arial"
        .Size = 12
        End With
Line100:
place = place + 1     ' increments the row number where data is entered
x = x + 1     ' increments the sheet order number
If x > Worksheets.Count Then GoTo Line999     ' last sheet has been added to the "Index" sheet
 
Next     ' loops to next sheet
 
Line999:
 
Sheets("Index").Columns("B:D").Select
    Columns("B:D").EntireColumn.AutoFit     ' adjusts column width to match length of longest entry
    ' comment-out the following code if it is not wanted / needed
    Columns("C:C").Select
    Selection.EntireColumn.Hidden = True     ' hides column with the sheet code names
    
Application.ScreenUpdating = True     ' turns real-time updating back on
 
Sheets("Index").Activate
Sheets("Index").Range("D2").Select
        ' the following scrolls the sheet up and to the left
        ActiveWindow.ScrollRow = 1
        ActiveWindow.ScrollColumn = 1
        
End Sub
'
 
Sub Go_To_Index()
 
' macro written by Doug Wilson, June 26, 2020
 
' this macro makes the sheet named "Index" the selected worksheet
 
Sheets("Index").Activate
Sheets("Index").Range("D2").Select
 
End Sub
'
4) On the Index worksheet insert a 'button or 'shape' of your choosing. Add text "Go To Index" (or whatever you prefer), format the font type and colour, the shape outline  and fill colour, and then assign the macro Go_To_Index() above to the button/shape. Copy this all worksheets.

5) If your workbook is large, an easy way to copy your 'button' is to add a code module in the VBE and copy the following to it:

Select All
 
Sub CopyButton_1()
'
' macro written by Doug Wilson July 1, 2020
' the 'button' must first be selected before running macro
' assign your desired macro or hyperlink to the 'button' before running this macro
 
' This macro will copy a 'button' to every sheet in a workbook
 
Dim x As Integer
Dim ws As Worksheet
 
Application.ScreenUpdating = False     ' allows macro to run faster - helpful with large workbooks
 
x = 2           ' used as a reference to the sheet's ORDER number from left to right in the workbook
                   '  (edit starting point as needed)
 
' on the sheet where the master button is, select the button to copy (edit as needed)
    Selection.Copy   ' button to copy
    
For Each ws In Worksheets     ' start the loop through all worksheets
    
    Sheets(x).Select   ' sheet where the button is being copied
    Range("A1").Select   ' cell where the button is being copied to (edit as needed)
    ActiveSheet.Paste   ' copying of the button
    Range("B3").Select   ' cell on sheet to be selected after copying the button (edit as needed)
    
    x = x + 1     ' increments the sheet ORDER number
If x > Worksheets.Count Then GoTo Line999     ' has been added to the last sheet
 
Next     ' loops to next sheet
 
Line999:
Application.ScreenUpdating = True     ' turns real-time updating back on
Application.CutCopyMode = False   ' exits cut/copy/paste mode (gets rid of marching ants)
 
' the following activates the "Index" sheet (edit "Index" to the sheet name as needed)
Sheets("Index").Activate
Sheets("Index").Range("D2").Select  ' cell on sheet to be selected (edit as needed)
        ' the following scrolls the sheet up and to the left
        ActiveWindow.ScrollRow = 1
        ActiveWindow.ScrollColumn = 1
End Sub
```

###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------

### CREATE TABLES


```vbA
Option Explicit
Sub CreateTable()
Dim ws As Worksheet
On Error GoTo ExitSub
    For Each ws In ActiveWorkbook.Worksheets
      ActiveSheet.ListObjects.Add(xlSrcRange, Range("$A$2:$G$1000"), , xlYes).Name = ws.Name 
      ws.Next.Activate
    Next ws
ExitSub:
End Sub
```

###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------

### SAVESHEETS 

```vbA
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
###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------

### REMOVE CHARACTERS LIKE

```vbA
Sub REMOVE_CHARACTERS_LIKE()

Dim Rng As RANGE
Dim XOUT As String
Dim xtemp As String
Dim xstr As String
Dim I As Integer

On Error Resume Next

For Each Rng In Selection

    XOUT = ""
    
    For I = 1 To Len(Rng.Value)
    
        xtemp = Mid(Rng.Value, I, 1)
        If xtemp Like "[a-z.A-Z.0-9]" Then
            xstr = xtemp
        Else
            xstr = ""
        End If
        
        XOUT = XOUT & xstr
        
    Next I
    
    Rng.Value = XOUT
    
Next

End Sub

```
###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------

### REMOVE CHARACTERS CASE

```vbA
Sub REMOVE_CHARACTERS_CASE()

    Dim Rng As RANGE
    Dim I As Integer
    Dim strResult As String
    Dim strSource As String

    For Each Rng In Selection
    
    strResult = ""
    
        For I = 1 To Len(Rng.Value)
        
            Select Case Asc(Mid(Rng.Value, I, 1))
            
                Case 48 To 57, 65 To 90, 97 To 122: 'include 32 if you want to include space
                
                    strResult = strResult & Mid(Rng.Value, I, 1)
                    
            End Select
            
        Next
        
        Rng.Value = strResult
        
    Next
    
End Sub

```

###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)


VBA Library
=====================

-------------------------

### FILTER DATA VIA POWER QUERY AND SAVE AS SEPERATE SHEET.

```VBA
    Sheets("MIAS").Select
    Range("A3:A" & Cells(Rows.Count, "A").End(xlUp).Row).FORMULA = "=[@[ROOMING LIST]]&"" ""&[@Room]"
    Range("B3:B" & Cells(Rows.Count, "B").End(xlUp).Row).FORMULA = "=IFERROR(TEXT([@[Check in]],""DD-MM-YY"")&"" ""&TEXT([@[Flight number]],""00000"")&"" ""&VLOOKUP([@Hotel],HOTELS,2,0),"""")"
    Range("C3:C" & Cells(Rows.Count, "C").End(xlUp).Row).FORMULA = "=SUMPRODUCT(1/COUNTIF($B$3:B3,$B$3:B3))"
    Range("D3:D" & Cells(Rows.Count, "D").End(xlUp).Row).FORMULA = "=SUMPRODUCT(1/COUNTIF($A$3:A3,A$3:A3))"
```


```VBA
Sub FORMULA_AND_SAVE()

Application.ScreenUpdating = False
Application.DisplayAlerts = False
Application.Calculation = xlManual

Dim ws As Worksheet
Dim SheetName As String
Dim FolderName As String
Dim lRow As Long

FolderName = "C:\LOCAL DATA\ROOMING"

' = "H:\My Documents\LOCAL\"

For Each ws In ThisWorkbook.Worksheets

    If ws.Name <> "MIAS" Then
    
        ws.Activate
        ws.Range("A2:A" & Cells(Rows.Count, "A").End(xlUp).Row).FORMULA = "=SUMPRODUCT(1/COUNTIF($P$2:P2,$P$2:P2))"
        ws.Range("B2:B" & Cells(Rows.Count, "B").End(xlUp).Row).FORMULA = "=SUMPRODUCT(1/COUNTIF($P$2:P2,$P$2:P2))"
        ws.Copy
        
        On Error Resume Next
        
        ActiveSheet.Name = Range("F2").Value
        ActiveSheet.SaveAs (FolderName & Range("Y2").Value)
        ActiveWorkbook.Close
    
        On Error GoTo ErrorOut
             
ErrorOut:
        
    End If
 
Next

Application.ScreenUpdating = True
Application.DisplayAlerts = True
Application.Calculation = xlAutomatic

MsgBox "FILES SAVED TO " & FolderName

End Sub
```

###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)  

ROOMING

```VBA
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

Sub ConnectionActive()

Dim Connection As Variant

    For Each Connection In ActiveWorkbook.Connections
    
        Connection.OLEDBConnection.BackgroundQuery = False
        
    Next Connection

End Sub

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

Sub PasteValues()

Sheets("TEMP").UsedRange.Copy Destination:=Sheets("MIAS").Range("e3")
Sheets("TEMP").Delete

End Sub

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

Sub Fixing()

Application.ScreenUpdating = True
Application.DisplayAlerts = True
Application.EnableEvents = True

End Sub



VBA Library
=====================

-------------------------
https://docs.github.com/en/github/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax
https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#links
https://docs.github.com/en/github/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-branches
https://github.com/AllenMattson/VBA
