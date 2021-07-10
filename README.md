

VBA Library
=====================

https://github.com/ScottypNZ/VBA

Features
--------
 * [COPY DOWN VISIBLE](#COPY-DOWN-VISIBLE)
 * [Login Form](#login-form)
 * [Static Queries](#static-queries)
 * [Insert](#insert)
 * [Select](#select)
 * [Update](#update)
 * [Delete](#delete)
 * [Helper Functions](#helper-functions)
 * [Unit Tests](#unit-tests)
 
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
Several different types of database execution can occur:
