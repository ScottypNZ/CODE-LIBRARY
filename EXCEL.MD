# FILTERS

DISTINCT LIST BY FORMULA  
=IFERROR(INDEX(MIAS_EXPORT[Check in],MATCH(0,INDEX(COUNTIF($A$1:A2,MIAS_EXPORT[Check in]),),0)),"")

DATA VALIDATION TO THE ABOVE DISTINCT LIST  
=OFFSET(DATES!$A$2,,,COUNTIF(DATES!$A$2:$A$501,"?*"))

DISTINCT NUMBER   
=SUMPRODUCT(1/COUNTIF($A$2:A2,A$2:A2))

DISTINCT NUMBER HIGHLIGHT ROW   
=ISEVEN($A2)

# EXCEL FORMULAS

HYPERLINK   
=HYPERLINK("#"&CELL("address",INDEX(BHR[BHR],MATCH([@BHR],BHR[BHR],0))),[@BHR])
=HYPERLINK("#"&CELL("address",'Sheet1'!A1),"LINK")

REPLACE LINE BREAK  
CTRL+H, CTRL+J

EXTRACT STRING AFTER LAST OCCURANCE OF DELIMITER   
=RIGHT(B3,LEN(B3)-SEARCH("$",SUBSTITUTE(B3,".","$",LEN(B3)-LEN(SUBSTITUTE(B3,".","")))))

EXTRACT STRING AFTER LAST OCCURANCE OF DELIMITER, IGNORE FIRST THREE LETTERS   
=UPPER(MID(
RIGHT(B2,LEN(B2)-SEARCH("$",SUBSTITUTE(B2,".","$",LEN(B2)-LEN(SUBSTITUTE(B2,".","")))))
,3,99))

# DATE FORMULAS   

DATE & TIME GROUPED BY 6HR BRACKETS  
=TEXT([@ARRIVAL],"DD-MM-YYYY")&" "&TEXT(CEILING(TIMEVALUE([@FlightArrivalTime]),0.25),"[HH]:MM")  

# CHARACTER CODES  

A-Z FILL    
=CHAR(CODE(A1) + 1)  

CLEANING   
https://support.microsoft.com/en-us/office/top-ten-ways-to-clean-your-data-2844b620-677c-47a7-ac3e-c2e157d1db19

SUBSTITUTE   
=LEN(B5)-LEN(SUBSTITUTE(B5,CHAR(10),"")) +1 

CHARACTER COUNT
=LEN([@[Mobile Phone]])-LEN(SUBSTITUTE([@[Mobile Phone]],"+",""))

# NAME FORMULAS

#### DOB SHORT PASSPORT REF
=TEXT([@[MIQ Period Start Date/Time]],"DD-MM-YYYY")&" "&TEXT([@[Date of Birth]],"DD-MM-YYYY")&" "&[@[Passport '#]]&" "&UPPER(TRIM(TRIM(LEFT(SUBSTITUTE([@[FULL NAME]]," ",REPT(" ",100)),100))&" "&TRIM(RIGHT(SUBSTITUTE([@[FULL NAME]]," ",REPT(" ",100)),100))))   

=TEXT([@[ArrivalDate]],"DD-MM-YYYY")&" "&TEXT([@[BirthDate]],"DD-MM-YYYY")&" "&[@[PassportNumber]]&" "&UPPER(TRIM(TRIM(LEFT(SUBSTITUTE([@[FULL NAME]]," ",REPT(" ",100)),100))&" "&TRIM(RIGHT(SUBSTITUTE([@[FULL NAME]]," ",REPT(" ",100)),100))))   

#### DOB SHORT REF
=TEXT([@[MIQ Period Start Date/Time]],"DD-MM-YYYY")&" "&TEXT([@[Date of Birth]],"DD-MM-YYYY")&" "&UPPER(TRIM(TRIM(LEFT(SUBSTITUTE([@[FULL NAME]]," ",REPT(" ",100)),100))&" "&TRIM(RIGHT(SUBSTITUTE([@[FULL NAME]]," ",REPT(" ",100)),100))))   

#### DOB PASSPORT REF
=TEXT([@[MIQ Period Start Date/Time]],"DD-MM-YYYY")&" "&TEXT([@[Date of Birth]],"DD-MM-YYYY")&" "&[@[Passport '#]]   


#### SHORT NAME    
=UPPER(TRIM(LEFT(SUBSTITUTE([@[FULL NAME]]," ",REPT(" ",100)),100))&" "&TRIM(RIGHT(SUBSTITUTE([@[FULL NAME]]," ",REPT(" ",100)),100)))

FULL NAME - EXCLUDING BLANKS  
=TRIM(UPPER(IF([@FirstName]<>"",[@FirstName],"")&" "&  
IF([@OtherNames]<>"",[@OtherNames],"")&" "&  
IF([@LastName]<>"",[@LastName],"")))  



# INVOICE FORMULA  

MONTH    JUN | 2021  
=UPPER(TEXT([@[Invoice Date]],"MMM"))&" | "&YEAR([@[Invoice Date]])

BUCKET DUE
=IF([@Status]="Paid","PAID",
IF(AND([@[DAYS ISSUED]]<=90,[@[DAYS ISSUED]]>=0),"ISSUED NOT DUE",
IF([@[DAYS ISSUED]]>90,"ISSUED OVERDUE","?"
)))

DAYS ISSUED    
=IF([@Status]<>"PAID",TODAY()-[@[Invoice Date]],0)

DAYS PAID  
=IF([@Status]="PAID",[@[Closed Date]]-[@[Invoice Date]],0)

UNPAID AMOUNT  
=IF([@[Invoice Amount]]=[@[Open Amount]],[@[Invoice Amount]],
IF([@[Invoice Amount]]<>[@[Open Amount]],[@[Open Amount]],"X"))

TOTAL ISSUED  
=[@[Invoice Amount]]

PAID AMOUNT  
=[@[TOTAL ISSUED]]-[@[UNPAID AMOUNT]]

ISSUED OVERDUE  
=IF([@[BUCKET DUE]]="ISSUED OVERDUE",[@[UNPAID AMOUNT]],0)

ISSUED NOT OVERDUE   
=IF([@[BUCKET DUE]]="ISSUED NOT DUE",[@[UNPAID AMOUNT]],0)

# GENERAL FORMULAS  

###### SPLITTEXT 
=LEFT(B5,FIND("_",B5)-1)  
=RIGHT(B5,LEN(B5)-FIND("_",B5))  
=SEARCH(“#”,SUBSTITUTE(B1,”-“,”#”,LEN(B1)-LEN(SUBSTITUTE(B1,”-“,””))))  
=RIGHT(SUBSTITUTE([@PASSPORT]," ",REPT(" ",100)),100))   

###### WEEK START
=IFERROR(VALUE(TEXT(LEFT([@[NZ Arrival Date]]-WEEKDAY([@[NZ Arrival Date]],3),5),"DD-MMM-YY")),"")

###### MONTH AS TEXT  
=UPPER(TEXT([@[End Date]],"mmmm"))

###### SEARCH FOR LETTER IN CELL  
=IF(ISNUMBER(SEARCH("M",[@[Room Number]],1)),"YES","NO")

###### SEARCH WORD IN EITHER CELL  
=IF(OR(COUNT(SEARCH({"COMM"},[@Passport]))>0,COUNT(SEARCH({"COMM"},[@Flight]))>0),"YES","NO")

###### AGE BUCKETS  
=IF(SUM([@[Start Date]]-[@[Date of Birth]])/365>18,"ADULT",
IF(AND(SUM([@[Start Date]]-[@[Date of Birth]])/365>=14,SUM([@[Start Date]]-[@[Date of Birth]])/365<18),"TEEN",
IF(SUM([@[Start Date]]-[@[Date of Birth]])/365<3,"INFANT",
"CHILD")))

###### FEES  
=IF([@[Staying in NZ for less than 90 days?]]="YES","YES",
IF([@[Left NZ after 11 August 2020?]]="YES","YES",
IF(AND([@[Ordinarily resident on 19 March 2020?]]="YES",[@[Left NZ on or before 19 March 2020?]]="YES"),"NO",
IF(AND([@[Ordinarily resident on 19 March 2020?]]="YES",[@[New Zealand / Aus Citizen / Resident?]]="YES"),"TBC",
IF(AND([@[New Zealand / Aus Citizen / Resident?]]="YES",[@[Are you a temporary visa holder?]]="YES"),"TBC",
IF(AND([@[New Zealand / Aus Citizen / Resident?]]="NO",[@[Are you a temporary visa holder?]]="NO"),"TBC",
IF(AND([@[New Zealand / Aus Citizen / Resident?]]="YES",[@[Staying in NZ for less than 90 days?]]="NO",[@[Left NZ after 11 August 2020?]]="NO"),"NO",
IF([@[New Zealand / Aus Citizen / Resident?]]="NO","YES",
IF([@[Are you a temporary visa holder?]]="YES","YES",
IF([@[Ordinarily resident on 19 March 2020?]]="NO","YES",
IF([@[Left NZ on or before 19 March 2020?]]="NO","YES",
IF([@[Entering NZ on a border exception?]]="YES","YES",
IF([@[Entering NZ on a border exception?]]="Yes - Critical Worker","YES",
IF([@[Entering NZ on a border exception?]]="Yes - Maritime Worker or Aircrew Member","YES",
"TBC"))))))))))))))













