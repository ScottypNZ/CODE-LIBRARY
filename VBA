
VBA Library
=====================

https://github.com/ScottypNZ/VBA

Features
--------
 * [COPY DOWN VISIBLE](#COPY-DOWN-VISIBLE)

 
### COPY DOWN VISIBLE
BASIC CODE TO COPY VALUES TO BOTTOM OF A TABLE WHEN FILTER ACTIVE

```vb
    Sub COPY_FILTERED_DOWN()
    Selection.Copy
    Range(Selection, Selection.End(xlDown)).Select
    Selection.SpecialCells(xlCellTypeVisible).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    End Sub
```

[TOP](https://github.com/ScottypNZ/VBA)

https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#headers
