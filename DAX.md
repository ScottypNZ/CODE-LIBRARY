# CODE-LIBRARY

ALL CITY SUMMARY
```
All City Summary = 
    CALCULATE(
        COUNTA(ToloaGrantRequests[ID]),
        ALLEXCEPT(ToloaGrantRequests,ToloaGrantRequests[City]))&" "&
ToloaGrantRequests[City]&" recipients receiving "&
    FORMAT(
    CALCULATE(
        SUM(ToloaGrantRequests[Total Paid]),
        ALLEXCEPT(ToloaGrantRequests,ToloaGrantRequests[City])),
        "$#,###")
```

PROVIDER SUMMARY
```
Steam Providers Summary = 
    IF(ToloaGrantRequests[Grant Type Groups]="Steam Provider",
        CALCULATE(
        COUNTA(ToloaGrantRequests[ID]),
        ALLEXCEPT(ToloaGrantRequests,ToloaGrantRequests[City]))&" "&
ToloaGrantRequests[City]&" recipients receiving "&
    FORMAT(
    CALCULATE(
        SUM(ToloaGrantRequests[Total Paid]),
        ALLEXCEPT(ToloaGrantRequests,ToloaGrantRequests[City])),
        "$#,###"))
```

PERCENTAGE OF TOTAL
```
INELIGIBLE APPS = Format( SUM(CRM_Applicatons[Not Eligible] )  /  max(CRM_Applicatons[CUM ALL]) , "Percent" )
```

LABEL
```
Map Label = 
   CALCULATE(
        COUNTA('3  2022/23 Toloa Scholarship Applications Database'[TOL ID]),'3  2022/23 Toloa Scholarship Applications Database'[App Status]="Complete"&&'3  2022/23 Toloa Scholarship Applications Database'[ApplicationOutcome]<>"Declined",
        ALLEXCEPT('3  2022/23 Toloa Scholarship Applications Database','3  2022/23 Toloa Scholarship Applications Database'[Residence NZ Region]))&" "&
'3  2022/23 Toloa Scholarship Applications Database'[Residence Region]&" successful applicants"
```

INVOICE PAID
```
Paid = 
IF(OR('Invoice Tracker July 2021-2022'[19. Paid]=BLANK(),'Invoice Tracker July 2021-2022'[19. Paid]="No"),"Unpaid","Paid")
``` 

INVOICE STATUS
```
Invoice Status = 
IF('Invoice Tracker July 2021-2022'[Paid]="Paid","Paid",
IF('Invoice Tracker July 2021-2022'[3. Fin Yr]="2020/21"&&'Invoice Tracker July 2021-2022'[13. 2020/21 Recon]=BLANK(),"Awaiting Provider Recon",
IF('Invoice Tracker July 2021-2022'[3. Fin Yr]="2020/21"&&'Invoice Tracker July 2021-2022'[13. 2020/21 Recon]="No","Awaiting Provider Recon",
IF('Invoice Tracker July 2021-2022'[Paid]="Unpaid"&&'Invoice Tracker July 2021-2022'[To be approved]=0,"Awaiting Verification",
if('Invoice Tracker July 2021-2022'[Paid]="Unpaid"&&'Invoice Tracker July 2021-2022'[To be approved]=1&&'Invoice Tracker July 2021-2022'[16. Mgmt Approval]=BLANK(),"To send for Mgmt Approval",
IF('Invoice Tracker July 2021-2022'[Paid]="Unpaid"&&'Invoice Tracker July 2021-2022'[To be approved]=1&&'Invoice Tracker July 2021-2022'[16. Mgmt Approval]<>BLANK()&&'Invoice Tracker July 2021-2022'[18. Finance]=BLANK(),"To be sent to Finance",
IF('Invoice Tracker July 2021-2022'[Paid]="Unpaid"&&'Invoice Tracker July 2021-2022'[16. Mgmt Approval]<>BLANK()&&'Invoice Tracker July 2021-2022'[To be approved]=1&&'Invoice Tracker July 2021-2022'[18. Finance]<>BLANK(),"Awaiting Pmt","")))))))```
```



APPROVAL TIME
```
Invoice approval time = 
DATEDIFF(
    IF('Invoice Tracker July 2021-2022'[16. Mgmt Approval]<>BLANK()&&'Invoice Tracker July 2021-2022'[Created]>'Invoice Tracker July 2021-2022'[16. Mgmt Approval],'Invoice Tracker July 2021-2022'[16. Mgmt Approval],'Invoice Tracker July 2021-2022'[Created]),
IF('Invoice Tracker July 2021-2022'[16. Mgmt Approval]=BLANK(),TODAY(),'Invoice Tracker July 2021-2022'[16. Mgmt Approval]),DAY)
```

12 MONTH SPEND
```
(C) 12 mths emp$ = 
VAR FY = 'Verified MARs ALL'[MAR FY]
VAR Activity = "12 mths emp"
VAR _Rate =
    CALCULATE (
        SELECTEDVALUE ( Rates[Rate]),
        Rates[Activity] = Activity,
        Rates[FY] = FY
    )
RETURN
    IF (
        'Verified MARs ALL'[Continuous Employment > 12 mths] <> BLANK(),
        'Verified MARs ALL'[Continuous Employment > 12 mths] * _Rate,
        BLANK ()
    )
```

RUNNING TOTAL NB: Sub is a binary text criteria in adjecent cell
```DAX
= Table.AddColumn(#"Added SUB", "CUM", each 
List.Sum( List.FirstN( #"Added SUB"[SUB], [Index] ) ) , Int64.Type)
```

MAXIF
```DAX
LastCertOfGivenType = 
VAR maxDate = CALCULATE(
              MAX('Navigator Certificate'[Expiry Due Date]),
                FILTER('Navigator Certificate', Navigator Certificate'[VesselCertType] 
		    = EARLIER('Navigator Certificate'[VesselCertType]) ) )
RETURN IF('Navigator Certificate'[Expiry Due Date] = maxDate,1,0)
```
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
