# CODE-LIBRARY

#### PIVOT MEASURES
FILTERS A FIELD WITHIN A TABLE WHERE CONDITION IN ISSUE COLUMN IS 'DUPE'
```DAX
=COUNTX(FILTER(PEOPLE_CLEAN,PEOPLE_CLEAN[ISSUE]="DUPE"),PEOPLE_CLEAN[ISSUE])
```
FILTERS AND COUNTS THE COLUMN WHERE VALUE IS NOT BLANK (MATCHED COLUMN)
```
=COUNTX(FILTER(PEOPLE_CLEAN,PEOPLE_CLEAN[TRITON]<>""),PEOPLE_CLEAN[TRITON])
```
SUBTRACTS COUNT OF ANY FIELD (ROW COUNT) FROM THE ABOVE. THIS RETURNS A COUNT OF THE BLANK FIELDS
```
=COUNT([Customer Number])-[MATCHED]
```

#### CREATE SUBTOTAL
```DAX
TABLE1 = DATATABLE ( "Name", STRING, "Ordinal", STRING, { { "", "" },  { "", "" }, { "", "" } } )
```

```DAX
TABLE1 = DATATABLE (
    "Name", STRING,
    "Ordinal", STRING,
    {
        { "", "" },
        { "", "" },
        { "", "" }
    }
)
```

#### ALMOST SUBTOTAL   
```DAX
 =IF ( not ( isfiltered ( BHR[ROW] ) ) ,  [COUNT ROOM REF] / 30.4,  [COUNT ROOM REF] /  
CALCULATE ( DISTINCTCOUNT(BHR[ROOM REF]),ALL(BHR[MONTH] ) ) *30.4 )	
```

#### BOOLEAN NUMBER SEARCH  
```DAX
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

#### SUBTOTAL NOTE
1) SUBTOTAL PERCENTAGES WILL NOT WORK UNLESS RUNNING OF A SINGLE VALUES COLUMN. 
2) ADD CALCULATED COLUMN WITH A SINGLE VALUE IN ALL CELLS (DATA NAME SUCH AS CRM).
3) ADD CALCULATED COLUMN USING IF RULE WITH DESIRED COLUMN HEADING
4) CREATE MEASURE FOR PERCENTAGE
5) CREATE IF RULE FOR SUBTOTAL

CALC ALL
```
=COUNT([Customer Number])
```

CALC PERCENT
```
=COUNT([Customer Number]) / [CALC ALL]
```

SUBTOTAL
```
=IF ( not ( isfiltered ( TABLE[CRM] ) ) ,  [CALC PERC] , COUNT([Customer Number] )  )
```
