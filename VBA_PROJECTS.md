VBA Library
=====================

### INDEX
--------

 * [SPLIT DATA](#SPLIT-DATA) 

-------------------------

### SPLIT DATA INTO SHEETS AND PROCESS  

```VB
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
