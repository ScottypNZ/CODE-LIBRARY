
VBA Library
=====================

### INDEX
--------
 * [COPY DOWN VISIBLE](#COPY-DOWN-VISIBLE)


-------------------------

### COPY DOWN VISIBLE [COPY VALUES TO BOTTOM OF A TABLE WHEN FILTER ACTIVE]

```vb
    Sub COPY_FILTERED_DOWN()
    Selection.Copy
    Range(Selection, Selection.End(xlDown)).Select
    Selection.SpecialCells(xlCellTypeVisible).Select
    Selection.PasteSpecial Paste:=xlPasteValues
    End Sub
```
[LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)

-------------------------

https://docs.github.com/en/github/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax

https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#links

https://docs.github.com/en/github/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-branches

https://github.com/AllenMattson/VBA
