# EXCEL FORMULAS

###### HYPERLINK
=HYPERLINK("#"&CELL("address",INDEX(BHR[BHR],MATCH([@BHR],BHR[BHR],0))),[@BHR])

###### SPLITTEXT 
=LEFT(B5,FIND("_",B5)-1)  
=RIGHT(B5,LEN(B5)-FIND("_",B5))  
https://exceljet.net/formula/split-text-string-at-specific-character  

###### WEEK START
=IFERROR(VALUE(TEXT(LEFT([@[NZ Arrival Date]]-WEEKDAY([@[NZ Arrival Date]],3),5),"DD-MMM-YY")),"")
