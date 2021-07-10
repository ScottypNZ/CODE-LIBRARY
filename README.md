# VBA
TEST OF README

BASIC CODE TO COPY VALUES TO BOTTOM OF A RANGE WHEN FILTERED

Sub COPY_FILTERED_DOWN()
    Selection.Copy
    
    Range(Selection, Selection.End(xlDown)).Select
    
    Selection.SpecialCells(xlCellTypeVisible).Select
    
    Selection.PasteSpecial Paste:=xlPasteValues
End Sub
