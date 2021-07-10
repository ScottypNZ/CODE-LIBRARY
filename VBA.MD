
VBA Library
=====================

### INDEX
--------
 * [COPY DOWN VISIBLE](#COPY-DOWN-VISIBLE)


-------------------------

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
 [INDEX](#INDEX)   |   [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)

-------------------------

https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#headers

[INDEX](#INDEX)
