https://github.com/ScottypNZ/VBA

#VBA


BASIC CODE TO COPY VALUES TO BOTTOM OF A TABLE WHEN FILTER ACTIVE


    Sub COPY_FILTERED_DOWN()
    Selection.Copy
    Range(Selection, Selection.End(xlDown)).Select
    Selection.SpecialCells(xlCellTypeVisible).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    End Sub
    
BASIC CODE

    Sub COPY_FILTERED_DOWN()
    Selection.Copy
    Range(Selection, Selection.End(xlDown)).Select
    Selection.SpecialCells(xlCellTypeVisible).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    End Sub
