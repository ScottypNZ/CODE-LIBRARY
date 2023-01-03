# CODE-LIBRARY

### THIS WORKBOOK 
BEFORE SAVE
``` vba
Private Sub Workbook_BeforeSave(ByVal SaveAsUI As Boolean, Cancel As Boolean)

Dim counter As Integer
    counter = 0

    For x = 2 To ThisWorkbook.Sheets("Drop downs").Range("z:z").Cells.SpecialCells(xlCellTypeConstants).Count + 3
        If UCase(Environ("username")) = UCase(ThisWorkbook.Sheets("Drop downs").Range("Z" & x).Value) Then
            counter = counter + 1
        End If
    Next x

    If counter < 1 Then
        Cancel = True
    End If

End Sub
```
WORKSHEET ACTIVATE
``` VBA
Private Sub Workbook_SheetActivate(ByVal Sh As Object)

Dim Sheet1 As String
Dim sheet2 As String

If ActiveSheet.Name = "Transitional_Housing" Then
    Sheet1 = "Transitional_Housing"
    sheet2 = "Alternative_Paid_Accommodation"
ElseIf ActiveSheet.Name = "Alternative_Paid_Accommodation" Then
    Sheet1 = "Alternative_Paid_Accommodation"
    sheet2 = "Transitional_Housing"

Else
    Exit Sub
End If


ThisWorkbook.Sheets(Sheet1).Range("e9").Value = ThisWorkbook.Sheets(sheet2).Range("e9").Value
ThisWorkbook.Sheets(Sheet1).Range("e10").Value = ThisWorkbook.Sheets(sheet2).Range("e10").Value
ThisWorkbook.Sheets(Sheet1).Range("e11").Value = ThisWorkbook.Sheets(sheet2).Range("e11").Value
ThisWorkbook.Sheets(Sheet1).Range("e12").Value = ThisWorkbook.Sheets(sheet2).Range("e12").Value

End Sub
```

WORKSHEET OPEN
``` VBA

Private Sub Workbook_Open()

    Sheets("Home").Visible = True
    Sheets("Home").Range("D12").Value = ""
    Sheets("Home").Range("D26").Value = ""


Dim x As Integer

For x = 1 To Worksheets.Count
    If Worksheets(x).Name <> "Home" Then
        Worksheets(x).Visible = xlVeryHidden
    End If
Next x

 MsgBox "This register is an information only tool" & Chr(13) & "   " & Chr(13) & _
 " If the register has opened as 'Read Only' you can still access all the latest vacancy " & _
  "information" & Chr(13) & "   " & Chr(13) & "Please enter your username and press the" & _
  " unlock icon to carry out a search", vbOKOnly + vbOKOnly, "Welcome to the Transitional Housing Centralised Register"

End Sub
```

WORKBOOK ENABLE VBA ON PROTECTED SHEET
```VBA
Private Sub Workbook_SheetSelectionChange(ByVal Sh As Object, ByVal Target As Range)

'=================[protect]
Dim wSheet As Worksheet

For Each wSheet In Worksheets
    If wSheet.Name = "Register_data" Then
        wSheet.Protect Password:="", DrawingObjects:=True, Contents:=True, Scenarios:=True, AllowFiltering:=True, _
        UserInterfaceOnly:=True '<---- allow all VBA macros to run on protected sheet, and filtering

        'Enable Group Collapse/Expand Capabilities
        ActiveSheet.EnableOutlining = True
    End If
Next wSheet
'=================[end protect]

Dim Sheet1 As String

If ActiveSheet.Name = "Transitional_Housing" Then
    Sheet1 = "Transitional_Housing"
' ElseIf ActiveSheet.Name = "Alternative_Paid_Accommodation" Then
' sheet1 = "Alternative_Paid_Accommodation"
Else
    Exit Sub
End If

Dim counter As Integer
    counter = 0

If ActiveCell.Value = "" Then
    Exit Sub
End If

If ActiveCell.Column = 11 Then
    counter = counter + 1
End If

If ActiveCell.Row > 20 Then
    counter = counter + 1
End If

If counter = 2 Then

Dim last As Integer
    'last = WorksheetFunction.CountA(Sheets("Register_data").Range("B:B"))
    last = Sheets("Register_data").Cells(rows.Count, 2).End(xlUp).Row
On Error Resume Next
    Sheets(Sheet1).Range("K9").Value = "-"
    Sheets(Sheet1).Range("K11").Value = "-"
    Sheets(Sheet1).Range("K13").Value = "-"
    Sheets(Sheet1).Range("K15").Value = "-"

    Sheets(Sheet1).Range("K9").Value = ActiveCell.Value
    Sheets(Sheet1).Range("K11").Value = WorksheetFunction.VLookup(Sheets(Sheet1).Range("K9"), Sheets("Register_data").Range("a1:n" & last), 14, False)
    Sheets(Sheet1).Range("K13").Value = WorksheetFunction.VLookup(Sheets(Sheet1).Range("K9"), Sheets("Register_data").Range("a1:g" & last), 7, False)

    If ActiveSheet.Name = "Transitional_Housing" Then
        Sheets(Sheet1).Range("K13").Value = WorksheetFunction.VLookup(Sheets(Sheet1).Range("K9"), Sheets("Register_data").Range("a1:h" & last), 8, False)
    End If


    If Sheets(Sheet1).Range("K13").Value = "" Then
        Sheets(Sheet1).Range("K13").Value = "-"
    End If
    Sheets(Sheet1).Range("K15").Value = WorksheetFunction.VLookup(Sheets(Sheet1).Range("K9"), Sheets("Register_data").Range("A1:r" & last), 18, False)


End If


End Sub
```
