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

# DIRECTIONS

CLEAN HTML
```VBA
' Usage :
' GetGoogleTravelTime (strFrom, strTo) returns a string containing journey duration : hh:mm
' GetGoogleDistance (strFrom, strTo) returns a string containing journey distance in either miles or km (as defined by strUnits)
' GetGoogleDirections (strFrom, strTo) returns a string containing the directions

Const strUnits = "metric" ' imperial/metric (miles/km)

Function CleanHTML(ByVal strHTML)
'Clean HTML instructions
Dim strInstrArr1() As String
Dim strInstrArr2() As String
Dim s As Integer

strInstrArr1 = Split(strHTML, "<")
For s = LBound(strInstrArr1) To UBound(strInstrArr1)
   strInstrArr2 = Split(strInstrArr1(s), ">")
   If UBound(strInstrArr2) > 0 Then
        strInstrArr1(s) = strInstrArr2(1)
   Else
        strInstrArr1(s) = strInstrArr2(0)
   End If
Next
 
CleanHTML = Join(strInstrArr1)
End Function
```
FORMAT GOOGLE TIME
```VBA 
Public Function formatGoogleTime(ByVal lngSeconds As Double)
'Converts seconds to time format hh:mm
 
Dim lngMinutes As Long
Dim lngHours As Long
 
lngMinutes = Fix(lngSeconds / 60)
lngHours = Fix(lngMinutes / 60)
lngMinutes = lngMinutes - (lngHours * 60)
 
formatGoogleTime = Format(lngHours, "00") & ":" & Format(lngMinutes, "00")
End Function
```
GOOGLE DIRECTION RESPONSE
```VBA
Function gglDirectionsResponse(ByVal strStartLocation, ByVal strEndLocation, ByRef strTravelTime, ByRef strDistance, ByRef strInstructions, Optional ByRef strError = "") As Boolean
On Error GoTo errorHandler
' Request and process XML generated by Google Maps.

Dim strURL As String
Dim objXMLHttp As Object
Dim objDOMDocument As Object
Dim nodeRoute As Object
Dim lngDistance As Long

Set objXMLHttp = CreateObject("MSXML2.XMLHTTP")
Set objDOMDocument = CreateObject("MSXML2.DOMDocument.6.0")
 
strStartLocation = Replace(strStartLocation, " ", "+")
strEndLocation = Replace(strEndLocation, " ", "+")
 
strURL = "http://maps.googleapis.com/maps/api/directions/xml" & _
            "?origin=" & strStartLocation & _
            "&destination=" & strEndLocation & _
            "&sensor=false" & _
            "&units=" & strUnits   'Sensor field is required by google and indicates whether a Geo-sensor is being used by the device making the request
 
'Send XML request
With objXMLHttp
    .Open "GET", strURL, False
    .setRequestHeader "Content-Type", "application/x-www-form-URLEncoded"
    .Send
    objDOMDocument.LoadXML .ResponseText
End With
 
With objDOMDocument
    If .SelectSingleNode("//status").Text = "OK" Then
        'Get Distance
        lngDistance = .SelectSingleNode("/DirectionsResponse/route/leg/distance/value").Text ' Retrieves distance in meters
        Select Case strUnits
            Case "imperial": strDistance = Round(lngDistance * 0.00062137, 1)  'Convert meters to miles
            Case "metric": strDistance = Round(lngDistance / 1000, 1) 'Convert meters to miles
        End Select
        
        'Get Travel Time
        strTravelTime = .SelectSingleNode("/DirectionsResponse/route/leg/duration/value").Text  'returns in seconds from google
        strTravelTime = formatGoogleTime(strTravelTime) 'converts seconds to hh:mm
        
        'Get Directions
        For Each nodeRoute In .SelectSingleNode("//route/leg").ChildNodes
            If nodeRoute.BaseName = "step" Then
                strInstructions = strInstructions & nodeRoute.SelectSingleNode("html_instructions").Text & " - " & nodeRoute.SelectSingleNode("distance/text").Text & vbCrLf
            End If
        Next
        
        strInstructions = CleanHTML(strInstructions) 'Removes MetaTag information from HTML result to convert to plain text.
        
    Else
        strError = .SelectSingleNode("//status").Text
        GoTo errorHandler
    End If
End With
 
gglDirectionsResponse = True
GoTo CleanExit
 
errorHandler:
    If strError = "" Then strError = Err.Description
    strDistance = -1
    strTravelTime = "00:00"
    strInstructions = ""
    gglDirectionsResponse = False
 
CleanExit:
    Set objDOMDocument = Nothing
    Set objXMLHttp = Nothing
 
End Function
```
GET GOOGLE TRAVEL TIME
```VBA 
Function getGoogleTravelTime(ByVal strFrom, ByVal strTo) As String
'Returns the journey time between strFrom and strTo
 
Dim strTravelTime As String
Dim strDistance As String
Dim strInstructions As String
Dim strError As String

If gglDirectionsResponse(strFrom, strTo, strTravelTime, strDistance, strInstructions, strError) Then
    getGoogleTravelTime = strTravelTime
Else
    getGoogleTravelTime = strError
End If
 
End Function
```

GET GOOGLE TRAVEL DISTANCE
```VBA 

Function getGoogleDistance(ByVal strFrom, ByVal strTo) As String
'Returns the distance between strFrom and strTo
 
Dim strTravelTime As String
Dim strDistance As String
Dim strError As String
Dim strInstructions As String

If gglDirectionsResponse(strFrom, strTo, strTravelTime, strDistance, strInstructions, strError) Then
    getGoogleDistance = strDistance
Else
    getGoogleDistance = strError
End If
 
End Function
```
GET GOOGLE DIRECTIONS
``` VBA
Function getGoogleDirections(ByVal strFrom, ByVal strTo) As String
'Returns the directions between strFrom and strTo

Dim strTravelTime As String
Dim strDistance As String
Dim strError As String
Dim strInstructions As String

If gglDirectionsResponse(strFrom, strTo, strTravelTime, strDistance, strInstructions, strError) Then
    getGoogleDirections = strInstructions
Else
    getGoogleDirections = strError
End If
 
End Function
```
# MAIN

```VBA
'Declare global variables for userform
Public t_1 As String, t_2 As String, t_3 As String, t_4 As String, t_5 As String, t_6 As String, t_7 As String, t_8 As String, t_9 As String, t_10 As String, _
t_11 As String, t_12 As String, t_13 As String, t_14 As String, t_15 As String, t_16 As String, t_17 As String, t_18 As String, t_19 As String, t_20 As String, _
t_21 As String, t_22 As String, _
init As Boolean
```

ADD NEW
```VBA
Sub AddNew()
    Application.GoTo Reference:="lastrow" 'go to last row of table
        Selection.EntireRow.Insert 'insert
            Selection.rows.AutoFit 'resize row
        Application.CutCopyMode = False 'Clear Clipboard
        
        Call Edit
End Sub
```
EDIT
```VBA
Sub Edit()
'check if selected row is within data range
Dim selr As Integer, headr As Integer, lastr As Long
selr = Selection.Row
    headr = Application.Range("header").Row
        lastr = Application.Range("lastrow").Row
If selr <= headr Or selr >= lastr Then
    Sheets("Register_data").Range("A" & headr + 1).Select
End If
    Data.Show
End Sub
```
AUTO FILTER
```VBA
Public Sub AutoFilter()
Application.ScreenUpdating = False

ThisWorkbook.Activate
    Application.GoTo Reference:="header"
    
    If ActiveSheet.AutoFilterMode Then
        ActiveSheet.AutoFilterMode = False
    Else
        ActiveSheet.Select
            rows(Selection.Row).Select 'select data headers
        Selection.AutoFilter
    End If
Application.ScreenUpdating = True
End Sub
```
DELETE
```VBA
Sub Delete()
'admin password
    Dim Answer As String
        Answer = InputBox("Please enter the admin password", "Password required")
        
        If Answer <> "adminonly" Then
            MsgBox "Wrong password", vbCritical + vbOKCancel, "Incorrect Password"
            Exit Sub
        End If

'check if selected row is within data range
Dim selr As Integer, headr As Integer, lastr As Long
selr = Selection.Row
    headr = Application.Range("header").Row
        lastr = Application.Range("lastrow").Row
If selr <= headr Or selr >= lastr Then
    MsgBox "Select a row in the data range", vbOKOnly, "Select a property to delete"
    Exit Sub
End If

Dim msgCfm As Long
On Error GoTo errorHandler1
        'confirm delete
        msgCfm = MsgBox("Are you sure you want to delete this record on row " & selr & "?", _
        vbYesNo + vbExclamation)
        
            If msgCfm = vbYes Then 'delete row
                Selection.EntireRow.Delete
                    MsgBox ("Row " & selr & " deleted."), vbOKOnly
                    Cells(selr, 1).Select
                    On Error GoTo 0
                Exit Sub
            End If

errorHandler1:
MsgBox ("No rows were deleted"), vbOKOnly
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

# UNHIDE


