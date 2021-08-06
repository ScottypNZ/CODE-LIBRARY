# EXCEL FORMULAS


###### HYPERLINK
=HYPERLINK("#"&CELL("address",INDEX(BHR[BHR],MATCH([@BHR],BHR[BHR],0))),[@BHR])

###### SPLITTEXT
https://exceljet.net/formula/split-text-string-at-specific-character
=LEFT(B5,FIND("_",B5)-1)
=RIGHT(B5,LEN(B5)-FIND("_",B5))
