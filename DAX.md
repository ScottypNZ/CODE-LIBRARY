# CODE-LIBRARY
ACTRYS MATRIX LIGHT
Goal Matrix

LEADS BY CREATION DATE
```
Leads by Creation Date = 
CALCULATE (
    [Leads ALL],
    TREATAS (
        VALUES ( 'Calendar'[Date] ),
        'Activation and Coordination'[Date - Created]
    )
)
```

LEADS ALL
```
Leads ALL = 
VAR X =
COUNTROWS ( 'Activation and Coordination' )

RETURN

IF(X = BLANK(), "", X)
```


LEAD DAYS AVERAGE
```
Lead Days Average = 
VAR X =
    AVERAGEX (
        'Activation and Coordination',
        'Activation and Coordination'[(C) Lead Age DAYS]
    )
RETURN
    IF ( X = BLANK (), "", X )
```

DYNAMIC SINGLE VALUE
```
DynamicSingleValue = 
VAR StartDate = DATE(2018,1,2)
VAR EndDate = MAX(SELECTEDVALUE('Report Tracker'[Report Due]), SELECTEDVALUE('Report Tracker'[Report Submitted Date]))

RETURN 
CALCULATE(
    [(m) Reports Submitted],
    DATESBETWEEN('Calendar'[Dates], DATE(2023,2,1), DATE(2023,4,1))
)
```

MAP LABEL
```
Map Label = 

VAR _count = COUNTX('Applications', 'Applications'[PACO ID])
VAR _Region = SELECTEDVALUE(Region[Region Short])
VAR _amount = FORMAT([(m) $ Total Funds Requested ex GST], "$#,###")

RETURN

COMBINEVALUES(" ",_count, _Region, " Applicants rqstg ", _amount)
```

CROSS JOIN
```
(m) CPF Education Apps = 
CALCULATE (
    [(m) Applications Received],
    FILTER (
        CROSSJOIN (
            ALL ( 'Documents'[$ - CPF Education Amount] ),
            ALL ( Initiatives[Initiative Type] )
        ),
        'Documents'[$ - CPF Education Amount] > 0
            || Initiatives[Initiative Type] = "CPF Education"
    )
)
```

DECLINE REASONS
```
(m) Declined Reasons = 
IF (
    HASONEVALUE ( 'Payment Tracker'[PACOF ID] ),
    CONCATENATEX (
        'Declined Reasons',
        'Declined Reasons'[Declined / Withdrawn Types],
        UNICHAR ( 10 )
    ),
    BLANK ()
)
```


DECISION DAYS
```
(m) Average Age DAYS Decision = 
AVERAGEX (
    'Applications',
    'Applications'[(c) Age of Application DAYS]
)
```

TURNAROUND TIMES
```
(m) Assessment Turnaround = 
VAR Single =
    IF (
            VALUES ( 'Documents'[Assessor_ID] ) <> BLANK () &&
            Values ( 'Documents'[Modified] ) = BLANK (),
        DATEDIFF (
            FIRSTDATE ( 'Last Refresh'[Last Refresh Date] ),
            Values ( 'Documents'[Modified] ),
            DAY
        ),
        IF (
            Values ( 'Applications'[Submitted Date] )
                > Values ( 'Documents'[Modified] ),
            DATEDIFF (
                Values ( 'Applications'[Submitted Date] ),
                Values ( 'Documents'[Modified] ),
                DAY
            ),
            DATEDIFF (
                Values ( 'Documents'[Assessor.Modified] ),
                Values ( 'Documents'[Modified] ),
                DAY
            )
        )
    )

VAR __table = SUMMARIZE('Documents',[PACOF ID],"__value", Single)
RETURN
IF(HASONEVALUE('Documents'[PACOF ID]),Single,AVERAGEX(__table,[__value]))
```


SUBTRACTING DATES
```
(m) Applications Received - Submitted Date = 
CALCULATE (
    [(m) Applications Received],
    TREATAS (
        VALUES ( 'Calendar'[Dates] ),
        'Applications'[Submitted Date]
    )
)
```

CONCAT NAME
```
1st Contact - Name = 
CONCATENATE('Main Tracking'[First Name]&" ", 'Main Tracking'[Last Name])
```

FUNDING GROUP
```
Funding Group = 
SWITCH(
    TRUE(),
    'Main Tracking'[Proposed Amount (excl. GST)] = BLANK(), BLANK(),
    'Main Tracking'[Proposed Amount (excl. GST)] < 5000, "< $5000",
    'Main Tracking'[Proposed Amount (excl. GST)] <= 10000, "$5000 - $10,000",
    'Main Tracking'[Proposed Amount (excl. GST)] <= 20000, "$10,001 - $20,000",
    "$20,001 - $30,000"
)
```

FUNDS OUTSTANING
```
(m) - Funds Outstanding % = 
DIVIDE( [(m) $ - Funds Outstanding], [(m) $ - Funding Value], 0 )
```

FUND VALUE LESS GST
```
(m) $ - Funding Value = 
CALCULATE (
    SUM ( 'Main Tracking'[$Approved (minus GST)] ),
    FILTER ( 'Main Tracking', ('Main Tracking'[(m) Approved Applications]) > 0 )
)
```

RUNNING TOTAL RECIEVED AFTER
```
(m) Accountability Reports Received running total = 
CALCULATE(
	[(m) Accountability Reports Received],
	FILTER(
		ALLSELECTED('Main Tracking'[Date AR received]),
		ISONORAFTER('Main Tracking'[Date AR received], MAX('Main Tracking'[Date AR received]), DESC)
	)
```

DYNAMIC Y AXIS
```
Dynamic Y-Axis = {
    ("Māori", NAMEOF('Sheet1'[ShowMaori-Graph2]), 3),
    ("Non-Pacific", NAMEOF('Sheet1'[ShowNonPacific-Graph2]), 1),
    ("NZ European", NAMEOF('Sheet1'[ShowNZEuropean-Graph2]), 4),
    ("Pacific", NAMEOF('Sheet1'[ShowPacificRate-Graph2]), 0),
    ("Total NZ population", NAMEOF('Sheet1'[ShowTotal-Graph2]), 2)
}
```

NAVIGATION PANE
```
NavigationPage4 = SELECTEDVALUE('Goal 4 Navigation'[Outcome])
```


HIGHLIGHT 
```
CF - Highlight row = 
VAR go = MAX(Sheet1[Goal])
VAR CF =
IF(go = 1, "#ff3300", 
IF(go = 2, "#990099",
IF(go = 3, "#E6AF24",
IF(go = 4, "#009999","grey"))))
RETURN
CF
```

GRAPH TYPE
```
GraphType_measure = IF(NOT(ISBLANK(SUM(Sheet1[Pacifica Rate]))) && ISBLANK(COUNT(Sheet1[Sub indicator])), 1, 
IF(ISBLANK(SUM(Sheet1[Pacifica Rate])) && ISBLANK(COUNT(Sheet1[Sub indicator])) && NOT(ISBLANK(SUM(Sheet1[Pacifica Number]))), 2, 
IF(NOT(ISBLANK(COUNT(Sheet1[Sub indicator]))) && ISBLANK(SUM(Sheet1[Pacifica Rate])) && NOT(ISBLANK(SUM(Sheet1[Pacifica Number]))), 3,
IF(NOT(ISBLANK(COUNT(Sheet1[Sub indicator]))) && NOT(ISBLANK(SUM(Sheet1[Pacifica Rate]))), 4,
    BLANK()))))
```

HIDE GRAPH
```
HideGraph = IF(ISFILTERED(Sheet1[Indicator name]),CALCULATE(SUM(Sheet1[Pacifica Rate])),CALCULATE(SUM(Sheet1[Pacifica Rate]), Sheet1[IsLatestDateByOutcome] = TRUE))
```


NZ EUROPEAN GRAPH
```
NZEuropean-Graph = IF(NOT(ISBLANK(Sheet1[Pacifica Rate])) && ISBLANK(Sheet1[Sub indicator]), Sheet1[NZ European Rate], 
IF(ISBLANK(Sheet1[Pacifica Rate]) && ISBLANK(Sheet1[Sub indicator]) && NOT(ISBLANK(Sheet1[Pacifica Number])), Sheet1[NZ European Number], 
IF(NOT(ISBLANK(Sheet1[Sub indicator])) && ISBLANK(Sheet1[Pacifica Rate]) && NOT(ISBLANK(Sheet1[Pacifica Number])), Sheet1[NZ European Number],
IF(NOT(ISBLANK(Sheet1[Sub indicator])) && NOT(ISBLANK(Sheet1[Pacifica Rate])), Sheet1[NZ European Rate],
    BLANK()))))
```

SCROLL MESSAGE
```Scroll-message = 
VAR min_val = MIN(Sheet1[index])--This code will show the narrative corresponding to the Indicator name even when nothing is selected
RETURN
    CALCULATE(MIN(Sheet1[Scroll-message_calc]), Sheet1[index] = min_val)
```

TOTALS
```
Total-Graph = IF(NOT(ISBLANK(Sheet1[Pacifica Rate])) && ISBLANK(Sheet1[Sub indicator]), Sheet1[Total Rate], 
IF(ISBLANK(Sheet1[Pacifica Rate]) && ISBLANK(Sheet1[Sub indicator]) && NOT(ISBLANK(Sheet1[Pacifica Number])), Sheet1[Total Number], 
IF(NOT(ISBLANK(Sheet1[Sub indicator])) && ISBLANK(Sheet1[Pacifica Rate]) && NOT(ISBLANK(Sheet1[Pacifica Number])), Sheet1[Total Number],
IF(NOT(ISBLANK(Sheet1[Sub indicator])) && NOT(ISBLANK(Sheet1[Pacifica Rate])), Sheet1[Total Rate],
    BLANK()))))
```

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
