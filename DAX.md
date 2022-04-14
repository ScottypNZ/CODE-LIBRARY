# CODE-LIBRARY

|	NAME	|  	CODE	| 
|	-------------	|	-------------	|
|	COUNT ROOM REF	|	 =COUNTA ( BHR[ROOM REF] ) 	|
|	COUNT CITY	|	 =COUNTA ( BHR[ROOM REF] )	|
|	COUNT HOTEL	|	 =COUNTA ( BHR[HOTEL] ) 	|
|	COUNT OF MONTH	|	 =COUNTA ( BHR[MONTH] ) 	|
|	COUNT OF DATE	|	 =COUNTA ( BHR[DATE] ) 	|
|	DISTINCT COUNT ROOM REF	|	 =DISTINCTCOUNT ( BHR[ROOM REF] )	|
|	DISTINCT COUNT CITY	|	 =DISTINCTCOUNT( BHR[City] ) 	|
|	DISTINCT COUNT HOTEL	|	 =DISTINCTCOUNT( BHR[HOTEL] )	|
|	DISTINCT COUNT OF MONTH	|	 =DISTINCTCOUNT ( BHR[MONTH] )	|
|	DISTINCT COUNT OF DATE	|	 =DISTINCTCOUNT( BHR[DATE] )	|
|	DISTINCT COUNT ROOMS (ALL ROWS 6155)	|	 =CALCULATE(DISTINCTCOUNT([ROOM REF]),ALL(BHR))	|
|	DISTINCT COUNT ROOMS (ALL HOTEL 65)	|	 =CALCULATE ( DISTINCTCOUNT(BHR[ROOM REF]),ALL(BHR[MONTH] ) )	|
|		|		|
|	COUNT	|	 = [COUNT OF ROOM REF]	|
|	MONTHLY	|	 = [COUNT] / 30.4	|
|	MAX	|	 = CALCULATE ( DISTINCTCOUNT(BHR[ROOM REF]),ALL(BHR[MONTH] ) ) *30.4	|
|	PERCENT	|	 = [COUNT] / [MAX]	|
|	SUBTOTAL	|	 = IF ( not ( isfiltered ( BHR[OFFICE] ) ) , [MONTHLY], [PERCENT] ) 	|
|		|		|


```DAX
ALMOST SUBTOTAL   
 =IF ( not ( isfiltered ( BHR[ROW] ) ) ,  [COUNT ROOM REF] / 30.4,  [COUNT ROOM REF] /  CALCULATE ( DISTINCTCOUNT(BHR[ROOM REF]),ALL(BHR[MONTH] ) ) *30.4 )	
```

```DAX
BOOLEAN NUMBER SEARCH  
=#"Added NUMBER FILTER" = Table.AddColumn(#"Changed Type", "MANUAL",   
each Text.Contains([#"Flight #"], "1")   
or  Text.Contains([#"Flight #"], "2")   
or Text.Contains([#"Flight #"], "3")   
or Text.Contains([#"Flight #"], "4")   
or Text.Contains([#"Flight #"], "5")   
or Text.Contains([#"Flight #"], "6")   
or Text.Contains([#"Flight #"], "7")   
or Text.Contains([#"Flight #"], "8")   
or Text.Contains([#"Flight #"], "9")   
or Text.Contains([#"Flight #"], "0")  
or Text.Contains([#"Flight #"], "ZK"))  
```
