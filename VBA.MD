
VBA Library
=====================

### INDEX
--------
 * [COPY DOWN VISIBLE](#COPY-DOWN-VISIBLE)
 * [CHANGE CASE](#CHANGE-CASE)

-------------------------

### COPY DOWN VISIBLE 

<p style="font-size;6pt">
    COPY VALUES TO BOTTOM OF A TABLE WHEN FILTER ACTIVE
</p>

```vb
Sub COPY_FILTERED_DOWN()
Selection.Copy
Range(Selection, Selection.End(xlDown)).Select
Selection.SpecialCells(xlCellTypeVisible).Select
Selection.PasteSpecial Paste:=xlPasteValues
End Sub
```
###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------
### CHANGE CASE 
```VB
Sub Uppercase()
For Each x In Range("A1:A5")
x.Value = UCase(x.value)
Next
End Sub
```
```VB
Sub Lowercase()
For Each x In Range("B1:B5")
x.Value = LCase(x.Value)
Next
End Sub
```
```VB
Sub Proper_Case()
For Each x In Range("C1:C5")
x.Value = Application.Proper(x.Value)
Next
End Sub
```
###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------

https://docs.github.com/en/github/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax

https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#links

https://docs.github.com/en/github/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-branches

https://github.com/AllenMattson/VBA
