# CODE-LIBRARY

# THIS WORKBOOK 
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

# PIVOTED 

```VBA
Private Sub Worksheet_PivotTableUpdate(ByVal Target As PivotTable)

Dim Sheet As String

If ActiveSheet.Name = "Alternative_Paid_Accommodation" Then
    Sheet = "Alternative_Paid_Accommodation"
ElseIf ActiveSheet.Name = "Transitional_Housing" Then
    Sheet = "Transitional_Housing"
Else
    Exit Sub
    
End If

For x = 21 To Sheets(Sheet).Range("K:K").Cells.SpecialCells(xlCellTypeConstants).Count + 10
    
    If Sheets(Sheet).Range("K" & x).Value <> "" Then
        Sheets(Sheet).Range("K" & x & ":M" & x).Delete Shift:=xlUp
        x = x - 1
    End If
    
Next x

End Sub
```

# VACANCIES 

```VBA

Private Sub Worksheet_Change(ByVal Target As Range)
    Dim A As Range, B As Range, Inte As Range, r As Range
    Set A = Range("A:A")
    Set Inte = Intersect(A, Target)
    If Inte Is Nothing Then Exit Sub
    Application.EnableEvents = False
        For Each r In Inte
            r.Offset(0, 1).Value = Date
        Next r
    Application.EnableEvents = True
End Sub
```
# UNHIDE
```VBA
Sub UnhideALL()
            Sheets("Home").Visible = True
            Sheets("Navigation").Visible = True
            Sheets("Vacancies").Visible = True
            Sheets("Register_data").Visible = True
            Sheets("Drop Downs").Visible = True
            Sheets("Pivoted").Visible = True
            Sheets("Form control").Visible = True 
            Sheets("Provider Information").Visible = True
            Sheets("Alternative_Paid_Accommodation").Visible = True
            Sheets("Transitional_Housing").Visible = True
End Sub
```

# SHAPES MODULE

HIDE SHAPES
```VBA
Sub HideShapes()
    Sheets("Transitional_Housing").Shapes("Rounded Rectangle 5").Visible = False
    Sheets("Transitional_Housing").Shapes("Rounded Rectangle 14").Visible = False
    Sheets("Transitional_Housing").Shapes("Rounded Rectangle 12").Visible = False
End Sub
```

INFORM ADMIN
```
Sub InformAdmin()

'Email search information to admin
''Sends the results of the Active Page to the selected emails in the "Drop Down" _
  worksheet Range "X4"

Dim Sheet1 As String

    If ActiveSheet.Name = "Transitional_Housing" Then
        Sheet1 = "Transitional_Housing"
'    ElseIf ActiveSheet.Name = "Alternative_Paid_Accommodation" Then
'        sheet1 = "Alternative_Paid_Accommodation"
    End If

 Dim Email_Subject, Email_Send_From, Email_Send_To, _
 Email_Cc, Email_Bcc, Email_Body As String
 Dim Mail_Object, Mail_Single As Variant
 Email_Subject = "Search performed on Auckland Transitional Housing Centralised Register"
 Email_Send_To = Sheets("Drop Downs").Range("X4").Value
 Email_Body = Sheets(Sheet1).Range("B9").Value & "     " & Sheets(Sheet1).Range("E9").Value & "                    " & Sheets(Sheet1).Range("B10").Value & "     " & Sheets(Sheet1).Range("E10").Value & "                    " & Sheets(Sheet1).Range("B11").Value & "     " & Sheets(Sheet1).Range("E11").Value & "                    " & Sheets(Sheet1).Range("B12").Value & "     " & Sheets(Sheet1).Range("E12").Value & "                    "

If Environ("Username") = "rngsh001" Then
    'Exit Sub
GoTo debugs
End If

 On Error GoTo debugs
 Set Mail_Object = CreateObject("Outlook.Application")
 Set Mail_Single = Mail_Object.CreateItem(0)

 With Mail_Single
    .Subject = Email_Subject
    .To = Email_Send_To
    .cc = Email_Cc
    .BCC = Email_Bcc
    .Body = Email_Body
    .Send
 End With

debugs:
 If Err.Description <> "" Then MsgBox Err.Description

Dim Sheet As String
Dim col1 As String
Dim col2 As String
Dim newrow As Integer

Dim try As String

If ActiveSheet.Name = "Alternative_Paid_Accommodation" Then
    Sheet = "Alternative_Paid_Accommodation"
    Clo1 = "a"
ElseIf ActiveSheet.Name = "Transitional_Housing" Then
    Sheet = "Transitional_Housing"
    Clo1 = "d"
Else
    Exit Sub
End If

For x = 21 To Sheets(Sheet).Range("K:K").Cells.SpecialCells(xlCellTypeConstants).Count + 10
    If Sheets(Sheet).Range("K" & x).Value <> "" Then
        Sheets(Sheet).Range("K" & x & ":M" & x).Delete Shift:=xlUp
        x = x - 1
    End If
Next x

newrow = 21
On Error Resume Next
For y = 5 To Sheets("Pivoted").Range(Clo1 & ":" & Clo1).Cells.SpecialCells(xlCellTypeConstants).Count + 1

    Sheets(Sheet).Range("K" & newrow).Value = Sheets("Pivoted").Range(Clo1 & y).Value
    
    
    If ActiveSheet.Name = "Alternative_Paid_Accommodation" Then
        Sheets(Sheet).Range("L" & newrow).Value = WorksheetFunction.VLookup(Sheets(Sheet).Range("K" & newrow), Sheets("Register_data").Range("A1:G100000"), 7, False)  'Cells.SpecialCells(xlLastCell)), 7, False)
    ElseIf ActiveSheet.Name = "Transitional_Housing" Then
        Sheets(Sheet).Range("L" & newrow).Value = WorksheetFunction.VLookup(Sheets(Sheet).Range("K" & newrow), Sheets("Register_data").Range("A1:H100000"), 8, False)
        Sheets(Sheet).Range("M" & newrow).Value = WorksheetFunction.VLookup(Sheets(Sheet).Range("K" & newrow), Sheets("Register_data").Range("A1:T100000"), 20, False)
    End If
    
    With Sheets(Sheet).Range("K" & newrow & ":M" & newrow).Borders(xlEdgeLeft)
        .ThemeColor = 1
    End With
    With Sheets(Sheet).Range("K" & newrow & ":M" & newrow).Borders(xlEdgeTop)
        .ThemeColor = 1
    End With
    With Sheets(Sheet).Range("K" & newrow & ":M" & newrow).Borders(xlEdgeBottom)
        .ThemeColor = 1
    End With
    With Sheets(Sheet).Range("K" & newrow & ":M" & newrow).Borders(xlEdgeRight)
        .ThemeColor = 1
    End With
    With Sheets(Sheet).Range("K" & newrow & ":M" & newrow).Borders(xlInsideVertical)
        .ThemeColor = 1
    End With
    With Sheets(Sheet).Range("K" & newrow & ":M" & newrow).Borders(xlInsideHorizontal)
        .ThemeColor = 1
    End With
    
    If ActiveSheet.Name = "Alternative_Paid_Accommodation" Then
        With Sheets(Sheet).Range("K" & newrow & ":M" & newrow).Interior
            .ThemeColor = xlThemeColorAccent3
            .TintAndShade = 0.799981688894314
            .PatternTintAndShade = 0
        End With
    ElseIf ActiveSheet.Name = "Transitional_Housing" Then
        With Sheets(Sheet).Range("K" & newrow & ":M" & newrow).Interior
            .ThemeColor = xlThemeColorAccent2
            .TintAndShade = 0.799981688894314
            .PatternTintAndShade = 0
        End With
    Else
        Exit Sub
    End If

    newrow = newrow + 1

Next y

If Sheets(Sheet).Range("K21").Value = "" Then
    MsgBox "No Results"
End If

End Sub
```

UNLOCK ICON
```VBA 
'Select Case Application.UserName
'Case "Gerald Higgins"
'GoTo bypass
'Case Else
'If Not ActiveWorkbook.ReadOnly Then ActiveWorkbook._
'        ChangeFileAccess Mode:=xlReadOnly
'bypass:
'End Select

Sub UnlockIcon()

'User Logins
'' Lets the user use the tool if their user name matches the cell in Range "D12" _
   of the "EHouseCentral" sheet
'' Gives admin Users extra screens to access if Username is also in Range "A26" _
   of the "EHouseCentral" sheet

If UCase(Sheets("Home").Range("D12").Value) = UCase(Environ("Username")) Then
    For x = 2 To Sheets("Drop downs").Range("z:z").Cells.SpecialCells(xlCellTypeConstants).Count + 2
        If UCase(Sheets("Home").Range("D12").Value) = UCase(Sheets("Drop downs").Range("z" & x).Value) Then
            'Admin rights
'            Sheets("Navigation").Visible = True
'            Sheets("Alternative_Paid_Accommodation").Visible = True
            Sheets("Transitional_Housing").Visible = True
            Sheets("Register_data").Visible = True
            Sheets("Drop Downs").Visible = True
            Sheets("Pivoted").Visible = True
            Sheets("Form control").Visible = False
            Sheets("Home").Visible = xlVeryHidden
        ElseIf UCase(Sheets("Home").Range("D12").Value) = UCase("rngsh001") Then
            'Dev rights
            Sheets("Navigation").Visible = True
            Sheets("Alternative_Paid_Accommodation").Visible = True
            Sheets("Transitional_Housing").Visible = True
            Sheets("Register_data").Visible = True
            Sheets("Drop Downs").Visible = True
            Sheets("Pivoted").Visible = True
            Sheets("Form control").Visible = Tue
            Sheets("Home").Visible = True
        Else
            'CM rights
'            Sheets("Navigation").Visible = True
'            Sheets("Alternative_Paid_Accommodation").Visible = True
            Sheets("Transitional_Housing").Visible = True
            Sheets("Home").Visible = True
'           Sheets("Home").Visible = xlVeryHidden

        End If
    
    Next x
End If

If Environ("Username") = "rngsh001" Then
    Exit Sub
End If

Dim Email_Subject, Email_Send_From, Email_Send_To, _
Email_Cc, Email_Bcc, Email_Body As String
Dim Mail_Object, Mail_Single As Variant
Email_Subject = "Unlocked Auckland Emergency Housing Centralised Register"
Email_Send_To = Sheets("Drop Downs").Range("X4").Value
Email_Body = Environ("Username") & " has unlocked the Transitional Housing Centralised Register"
         
On Error GoTo debugs
Set Mail_Object = CreateObject("Outlook.Application")
Set Mail_Single = Mail_Object.CreateItem(0)

With Mail_Single
   .Subject = Email_Subject
   .To = Email_Send_To
   .cc = Email_Cc
   .BCC = Email_Bcc
   .Body = Email_Body
   .Send
End With
        
debugs:
         If Err.Description <> "" Then MsgBox Err.Description

End Sub
```

AMOUT THE PROVIDER
```VBA
Sub AboutTheProvider()

About.Show

End Sub
```
SUITABILITY CHECK
```VBA
Sub Suitability_check()

Suitability.Show

End Sub
```
CLIENT EVENT
```VBA
Sub ClientEvent()

Notes.Show

End Sub
```
GO TO EMERGENCY HOUSING
```VBA
Sub GotoEmergencyHousing()

    Sheets("Transitional_Housing").Activate

End Sub
```
GO TO ALTERNATIVE

```VBA
Sub GotoAlternativePaid()
'
    Sheets("Alternative_Paid_Accommodation").Activate

End Sub
```


# NOTES
CANCEL NOTES CLICK
```VBA 
Private Sub CancelNotes_Click()
Unload Me
End Sub
```


Private Sub CopyNotes_Click()

'ActiveSheet.Range("a3").Value = "What is the clients household type?:"
'ActiveSheet.Range("a4").Value = Household.Value
'ActiveSheet.Range("a5").Value = "Reason for need?:"
'ActiveSheet.Range("a6").Value = ResonsWhy.Value
'
'ActiveSheet.Range("a8").Value = "Client Situation:"
'ActiveSheet.Range("a9").Value = ClientsSituation.Value
'
'ActiveSheet.Range("a11").Value = "Client event note"
'ActiveSheet.Range("a12").Value = Notes.Value

Dim clipboard As MSForms.DataObject
Set clipboard = New MSForms.DataObject
clipboard.SetText "Client Number:" & ClientNumber.Value & _
                  "          Is client in receipt of assistance?:" & Assistance.Value & _
                  "          What is the clients household type?:" & Household.Value & _
                  "          Reason for need?:" & ResonsWhy.Value & _
                  "          Client Situation:" & ClientsSituation.Value & _
                  "          Reason for need?:" & Notes.Value

clipboard.PutInClipboard


End Sub

Private Sub Email_Manager_Click()

Sheets.Add.Name = "DeleteMe"

Sheets("DeleteMe").Range("a1").Value = "Client Number:"
Sheets("DeleteMe").Range("b1").Value = ClientNumber.Value
Sheets("DeleteMe").Range("c1").Value = "Is client in receipt of assistance?:"
Sheets("DeleteMe").Range("d1").Value = Assistance.Value

Sheets("DeleteMe").Range("a3").Value = "What is the clients household type?:"
Sheets("DeleteMe").Range("a4").Value = Household.Value
Sheets("DeleteMe").Range("a5").Value = "Reason for need?:"
Sheets("DeleteMe").Range("a6").Value = ResonsWhy.Value

Sheets("DeleteMe").Range("a8").Value = "Client Situation:"
Sheets("DeleteMe").Range("a9").Value = ClientsSituation.Value

Sheets("DeleteMe").Range("a11").Value = "Client event note"
Sheets("DeleteMe").Range("a12").Value = Notes.Value

Sheets("DeleteMe").Columns("A:D").EntireColumn.AutoFit

Dim Email_Subject, Email_Send_From, Email_Send_To, _
Email_Cc, Email_Bcc, Email_Body As String
Dim Mail_Object, Mail_Single As Variant
Email_Subject = "Requesting approval for hardship using EHouseCentral"
Email_Send_To = EmailList.Value
Email_Body = Sheets("DeleteMe").Range("a1").Value & "     " & Sheets("DeleteMe").Range("b1").Value & "                    " _
           & Sheets("DeleteMe").Range("c1").Value & "     " & Sheets("DeleteMe").Range("d1").Value & "                    " _
           & Sheets("DeleteMe").Range("a3").Value & "     " & Sheets("DeleteMe").Range("a4").Value & "                    " _
           & Sheets("DeleteMe").Range("a5").Value & "     " & Sheets("DeleteMe").Range("a6").Value & "                    " _
           & Sheets("DeleteMe").Range("a8").Value & "     " & Sheets("DeleteMe").Range("a9").Value & "                    " _
           & Sheets("DeleteMe").Range("a11").Value & "     " & Sheets("DeleteMe").Range("a12").Value & "                    "
On Error GoTo debugs
Set Mail_Object = CreateObject("Outlook.Application")
Set Mail_Single = Mail_Object.CreateItem(0)

With Mail_Single
   .Subject = Email_Subject
   .To = Email_Send_To
   .cc = Email_Cc
   .BCC = Email_Bcc
   .Body = Email_Body
   .Send
End With

debugs:
If Err.Description <> "" Then MsgBox Err.Description

Application.DisplayAlerts = False
    Sheets("DeleteMe").Delete
Application.DisplayAlerts = True

End Sub

Private Sub PrintNotes_Click()

CopyNotes_Click
ActiveSheet.PrintOut

End Sub

Private Sub UserForm_Activate()

Notes.Value = Sheets("Drop downs").Range("AB4").Value

Dim Sheet As String

If ActiveSheet.Name = "Transitional_Housing" Then
    Sheet = "Transitional_Housing"
    
    ClientNumber.BackColor = RGB(242, 221, 220)
    Assistance.BackColor = RGB(242, 221, 220)
    Household.BackColor = RGB(242, 221, 220)
    ResonsWhy.BackColor = RGB(242, 221, 220)
    ClientsSituation.BackColor = RGB(242, 221, 220)
    Notes.BackColor = RGB(242, 221, 220)
    Label4.BackColor = RGB(242, 221, 220)
    Label3.BackColor = RGB(242, 221, 220)
    Label2.BackColor = RGB(242, 221, 220)
    CopyNotes.BackColor = RGB(242, 221, 220)
    Email_Manager.BackColor = RGB(242, 221, 220)
    PrintNotes.BackColor = RGB(242, 221, 220)
    
    Banner.ForeColor = RGB(200, 0, 0)

ElseIf ActiveSheet.Name = "Alternative_Paid_Accommodation" Then
    Sheet = "Alternative_Paid_Accommodation"
Else
    Unload Me
    Exit Sub
End If

    ClientNumber.Value = Sheets(Sheet).Range("E9").Value
    Assistance = Sheets(Sheet).Range("E10").Value
    Household = Sheets(Sheet).Range("E11").Value
    ResonsWhy = Sheets(Sheet).Range("E12").Value
    
For x = 4 To Sheets("Drop Downs").Range("p:P").Cells.SpecialCells(xlCellTypeConstants).Count + 2

    With EmailList
        .AddItem Sheets("Drop Downs").Range("P" & x).Value
    End With

Next x

End Sub
```

