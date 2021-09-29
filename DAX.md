# CODE-LIBRARY

DISTINCT COUNT ALL ROOMS, DISPLAYED IN ALL ROWS  
=CALCULATE(DISTINCTCOUNT([ROOM REF]),ALL(BHR))

COUNT, DISPLAYED IN ALL ROWS  
=COUNTROWS(ALL('BHR'))

DISTINCT COUNT HOTEL ROOMS, DISPLAYED IN ALL MONTHLY ROWS  
=CALCULATE ( DISTINCTCOUNT(BHR[ROOM REF]),ALL(BHR[MONTH] ) )

DISTINCT COUNT HOTELS, DISPLAYED IN ALL ROWS  
=Calculate ( DISTINCTCOUNT(BHR[HOTEL] ), all(BHR) )

AVERAGE OF ROOMS  
=[Count of ROOM REF]/[Distinct Count of ROOM REF]

AVERAGE MIQ
=[ROWS]/[ROOM]

AVERAGE PER  
=[AVERAGE]/[AVERAGE ALL]

MAX ROOM USAGE  
=MAXX ( VALUES ( BHR[ROOM REF] ), CALCULATE ( COUNTA ( BHR[ROOM REF] ) ) )

MAX OF ROOM REF PER HOTEL (NOTE MAX HOTEL IS A MEASURE]  
=Calculate ( MAXX ( values  ( BHR[ROOM REF] ) , [MAX HOTEL] ) , ALL ( BHR ) )

FILTER HOTEL  
=CALCULATE('BHR ALL ROOMS'[Count of ROOM REF],'BHR ALL ROOMS'[HOTEL]="BAYWELS")

TYPE ERROR  
=SUMMARIZECOLUMNS('BHR ALL ROOMS'[ROOM REF],FILTER('BHR ALL ROOMS',[HOTEL]))

MAX OF ROOM REF PER HOTEL (NOTE MAX HOTEL IS A MEASURE]  
=Calculate ( MAXX ( values  ( BHR[ROOM REF] ) , [MAX HOTEL] ) , ALL ( BHR ) )

CEILING  
= CEILING ( [Count of ROOM REF], 20 )

SUBTOTAL PIVOT FORMULA  
= IF ( not ( isfiltered ( BHR[ROW] ) ) , [Count of ROOM REF] / 30.4 , [Count of ROOM REF] )

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

