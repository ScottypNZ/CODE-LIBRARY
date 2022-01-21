
COPY FORMULA TO USED RANGE   
Range("D3:D" & Cells(Rows.Count, "D").End(xlUp).Row).FORMULA = "=SUMPRODUCT(1/COUNTIF($A$3:A3,A$3:A3))"
Sheets("TEMP").UsedRange.Copy Destination:=Sheets("MIAS").Range("e3")

SHOW QUERY BAR   
Application.CommandBars("Queries and Connections").Visible=True

START LINES   
Application.ScreenUpdating = False
Application.DisplayAlerts = False
Application.EnableEvents = False
Application.Calculation = xlAutomatic

CLEAR   
ActiveWorkbook.Sheets("MIAS").Range("A3:AH1000").Clear

RESIZE   
ActiveWorkbook.Sheets("MIAS").ListObjects("MIAS").Resize Range("$A$2:$AH$3")

COPY AND PASTE   
Sheets("TEMP").UsedRange.Copy Destination:=Sheets("MIAS").Range("e3")

