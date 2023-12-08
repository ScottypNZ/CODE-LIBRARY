### INDEX

 * [MPP](#MPP)
 * [GENERAL](#GENERAL)
 * [MBIE](#MBIE)
 * [MARITIME](#MARITIME)

 

###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------
### MPP

```SQL 

[REFERENCE]   
= CONCAT(APP.[klevr_applicationnumber],' | ',QTN.klevr_questionnumber),

[LINK]
= CONCAT('https://prodkatoatoa.crm6.dynamics.com/api/data/v9.0/klevr_formresponses(',RES.klevr_formresponseid,')/klevr_file/$value'),

[OCCUR]      
= ROW_NUMBER() OVER(PARTITION BY APP.[klevr_applicationnumber] ORDER BY  SUB.createdon desc, ASS.createdon desc, SUB.[subject] DESC ) AS [OCCUR]

[DATETIME]
CONCAT(  CONVERT(VARCHAR(10), cast( SUB.createdon as Date)), ' ', CONVERT(VARCHAR(8),  cast( SUB.createdon as Time))  ) AS 'SUB Created',
NO DECIMAL

[CUMULATIVE SUM]
=  SUM(Done) OVER (ORDER BY [SUB Modified] asc) as 'Running' (Being a binary calc column of approved)

LEFT OF CHARACTER
=left(FRM.[klevr_name],CHARINDEX(':',FRM.[klevr_name]) - 1)				as 'Form Type',

RETURNS BLANK IF NOT FOUND
=left(FRM.[klevr_name], charindex(':',FRM.[klevr_name] + ':' ) - 1 )   			as 'Form Type',

RETURNS ORIGINAL IF NOT FOUND
=left(FRM.[klevr_name], ISNULL(NULLIF(charindex(':',FRM.[klevr_name] ) - 1,-1 ),0 ) )    as 'Form Type',

```

CRM JOINS
``` sql
select top (100) * FROM  [dbo].[klevr_application] APP

 left join [dbo].[klevr_formsubmission]	 as SUB on SUB.regardingobjectid		= APP.klevr_applicationid
 left join [dbo].[klevr_assessment] 	 as ASS on ASS.[klevr_applicationid]		= APP.klevr_applicationid
 left join [dbo].[contact]		 as CON on CON.contactid			= APP.[klevr_applicant]
 left join [dbo].[klevr_form]		 as FRM on FRM.klevr_formid			= APP.[klevr_formid]
 left join [dbo].[klevr_formresponse]	 as RES on RES.klevr_formsubmissionid		= SUB.activityid
 left join [dbo].[klevr_question]	 as QTN on QTN.[klevr_questionid]		= RES.[klevr_questionid]
 left join [dbo].[fileattachment]	 as ATT on ATT.[objectid]			= RES.klevr_formresponseid
 left join account			 as ACT on ACT.accountid 			= CON.accountid
```

CRM ANSWERS AND FILTERS
``` sql
-- [Contact ID], [Post Code],
-- ASSESSMENT --

SELECT * FROM (
select [activityid], [Stream], [Contact ID], [Post Code], [APP ID], [ASS ID], [Assessor], [APP Status], [ASS Status], [Status] from (
SELECT 
case when APP.[klevr_formidname] like '%Tertiary%'	then 'Tertiary'			else
case when APP.[klevr_formidname] like '%9%'		then 'Year 9 to 10'		else
case when APP.[klevr_formidname] like '%13%'		then 'Year 11 to 13'    end end end  	as 'Stream',
CON.ws_contactid								    		as 'Contact ID', 
CON.address1_postalcode								     		as 'Post Code',
APP.[klevr_applicationnumber]							     		as 'APP ID',
ASS.[klevr_assessmentautonumber]					             		as 'ASS ID',
ASS.[klevr_assessoridname]						             		as 'Assessor',
APP.[klevr_portalsubmissionstatuscodename]					     		as 'APP Status',
ASS.[klevr_assessorrecommendationcodename]					     		as 'ASS Status',
sub.statuscodename								    		as 'Status',
SUB.activityid,
ASS.statecodename,
COUNT(*) over(partition by app.klevr_applicationid) 				     		as 'Count',
ROW_NUMBER() OVER(PARTITION BY ASS.klevr_assessmentid ORDER BY  SUB.[subject] DESC ) 		as [OCCUR]

FROM [klevr_formsubmission]	     as SUB
left join [dbo].[klevr_assessment]   as ASS on ASS.klevr_assessmentid			= SUB.regardingobjectid
left join [dbo].[klevr_application]  as APP on APP.klevr_applicationid			= ASS.klevr_applicationid
left join contact		     as CON on CON.contactid				= app.klevr_applicant

where klevr_applicationroundidname like '%Steam%' and ASS.statecodename = 'Active'
)Sub
where occur = 1 

Union all

-- APPLICATION --
select [activityid], [Stream], [Contact ID], [Post Code], [APP ID], [ASS ID], [Assessor], [APP Status], [ASS Status], [Status]  from (
SELECT 
case when APP.[klevr_formidname] like '%Tertiary%'	then 'Tertiary'			else
case when APP.[klevr_formidname] like '%9%'		then 'Year 9 to 10'		else
case when APP.[klevr_formidname] like '%13%'		then 'Year 11 to 13'    end end end 	 				as 'Stream',
CON.ws_contactid										 				as 'Contact ID', 
CON.address1_postalcode										 				as 'Post Code',
APP.[klevr_applicationnumber]									 				as 'APP ID',
ASS.[klevr_assessmentautonumber]								 				as 'ASS ID',
ASS.[klevr_assessoridname]									 				as 'Assessor',
APP.[klevr_portalsubmissionstatuscodename]						         				as 'APP Status',
ASS.[klevr_assessorrecommendationcodename]					                 				as 'ASS Status',
sub.statuscodename										 				as 'Status',
SUB.activityid,												
COUNT(*) over(partition by app.klevr_applicationid) 						 				as 'Count app',
ROW_NUMBER() OVER(PARTITION BY APP.[klevr_applicationnumber] ORDER BY ASS.[klevr_assessmentautonumber] DESC )			as [OCCUR]
FROM [klevr_formsubmission]													as SUB
left join [dbo].[klevr_application]	as APP on APP.klevr_applicationid		= SUB.regardingobjectid
left join [dbo].[klevr_assessment]	as ASS on ASS.klevr_applicationid		= APP.klevr_applicationid
left join contact			as CON on CON.contactid				= app.klevr_applicant

where klevr_applicationroundidname like '%Steam%' 
and  APP.[klevr_portalsubmissionstatuscodename]	= 'Submitted'  
and  app.statecodename = 'Active'
) Sub
where		[occur] = 1  
) Sub2 

LEFT JOIN
(
select 
activityid, 
[QTN ID],
case when [Question] like '%Ethnic%' then 'Ethnicity' else
case when [QTN1] IS NULL AND  [QTN2] IS NULL THEN [Question]  else 
case when [QTN1] IS NULL THEN [QTN2] ELSE [QTN1] END END END as 'Questions',
[Answers]
from (

SELECT  
SUB.activityid,
QTN.klevr_questionnumber										as 'QTN ID',
STN.klevr_name												as 'Section',
RES.klevr_questionidname										as 'Question',
RES.klevr_response											as 'Answers',

case when RES.klevr_questionidname = 'Academic Assessment Science Score'  		then 'Science' 
else case when RES.klevr_questionidname = 'Academic Assessment Technology Score'	then 'Technology'	
else case when RES.klevr_questionidname = 'Academic Assessment Engineering Score'	then 'Engineering'	
else case when RES.klevr_questionidname = 'Academic Assessment Arts Score'		then 'Arts'			
else case when RES.klevr_questionidname = 'Academic Assessment Math Score'		then 'Math'			
else case when RES.klevr_questionidname = 'Community Impact Score'			then 'Community'	
else case when RES.klevr_questionidname = 'Career Aspirations Score'			then 'Career'		
else case when RES.klevr_questionidname = 'Financial Hardship Score'			then 'Financial'	end end end end end end end end as 'QTN1' ,
 
case when QTN.[klevr_formidname] like '%Tertiary%'	 
and STN.klevr_name = 'Academic Record Assessment and Answers'			
and	 RES.klevr_questionidname = 'Overall comments'		
then 'Academic Comment'		else

case when QTN.[klevr_formidname] like '%Tertiary%'	 
and STN.klevr_name = 'Assessment answers and comments'					
and RES.klevr_questionidname = 'Overall comment'
then 'Scholarship Comment'	else

case when QTN.[klevr_formidname] like '%13%'		 
and STN.klevr_name = 'Assessment answers and comments'
and RES.klevr_questionidname = 'Overall comments'		
then 'Academic Comment'	else
	
case when QTN.[klevr_formidname] like '%13%'		
and STN.klevr_name = 'Scholarship Satements Answers and Comments'		
and RES.klevr_questionidname = 'Overall comment'		
then 'Scholarship Comment'	else

case when QTN.[klevr_formidname] like '%9%'
and STN.klevr_name = 'Academic Assessment'
and RES.klevr_questionidname = 'Overall comment'		
then 'Academic Comment'		else

case when QTN.[klevr_formidname] like '%9%'			 
and STN.klevr_name = 'Scholarship Statements Answers and Comments'		
and RES.klevr_questionidname = 'Overall comment'		
then 'Scholarship Comment'	
end end end end end end as 'QTN2'

FROM [klevr_formsubmission]								as SUB
left join [dbo].[klevr_formresponse]							as RES on RES.klevr_formsubmissionid		= SUB.activityid
left join [dbo].[klevr_question]							as QTN on QTN.[klevr_questionid]		= RES.klevr_questionid
left join [dbo].[klevr_section]								as STN on STN.klevr_sectionid			= QTN.klevr_sectionid
left join [dbo].[klevr_assessment]							as ASS on ASS.klevr_assessmentid		= SUB.regardingobjectid
left join [dbo].[klevr_application]							as APP on APP.klevr_applicationid		= ASS.klevr_applicationid

WHERE 
QTN.klevr_questionnumber = 'QTN-01711' OR 
QTN.klevr_questionnumber = 'QTN-01713' OR
QTN.klevr_questionnumber = 'QTN-01713' OR
QTN.klevr_questionnumber = 'QTN-01717' OR
QTN.klevr_questionnumber = 'QTN-01715' OR
QTN.klevr_questionnumber = 'QTN-01719' OR
QTN.klevr_questionnumber = 'QTN-01722' OR
QTN.klevr_questionnumber = 'QTN-01645' OR
QTN.klevr_questionnumber = 'QTN-01643' OR
QTN.klevr_questionnumber = 'QTN-01644' OR
QTN.klevr_questionnumber = 'QTN-01647' OR
QTN.klevr_questionnumber = 'QTN-01696' OR
QTN.klevr_questionnumber = 'QTN-01700' OR
QTN.klevr_questionnumber = 'QTN-01702' OR
QTN.klevr_questionnumber = 'QTN-01704' OR
QTN.klevr_questionnumber = 'QTN-01706' OR
QTN.klevr_questionnumber = 'QTN-01721' OR
QTN.klevr_questionnumber = 'QTN-01631' OR
QTN.klevr_questionnumber = 'QTN-01629' OR
QTN.klevr_questionnumber = 'QTN-01630' OR
QTN.klevr_questionnumber = 'QTN-01633' OR
QTN.klevr_questionnumber = 'QTN-01683' OR
QTN.klevr_questionnumber = 'QTN-01685' OR
QTN.klevr_questionnumber = 'QTN-01687' OR
QTN.klevr_questionnumber = 'QTN-01689' OR
QTN.klevr_questionnumber = 'QTN-01691' OR
QTN.klevr_questionnumber = 'QTN-01720' OR
QTN.klevr_questionnumber = 'QTN-01679' OR
QTN.klevr_questionnumber = 'QTN-01677' OR
QTN.klevr_questionnumber = 'QTN-01678' OR
QTN.klevr_questionnumber = 'QTN-01681' OR

QTN.klevr_questionnumber = 'QTN-01331' OR
QTN.klevr_questionnumber = 'QTN-01347' OR
QTN.klevr_questionnumber = 'QTN-01123' OR
QTN.klevr_questionnumber = 'QTN-01120' OR
QTN.klevr_questionnumber = 'QTN-01329' OR
QTN.klevr_questionnumber = 'QTN-01344' OR
QTN.klevr_questionnumber = 'QTN-01122' OR
QTN.klevr_questionnumber = 'QTN-01346' OR
QTN.klevr_questionnumber = 'QTN-01345' OR
QTN.klevr_questionnumber = 'QTN-01330' OR
QTN.klevr_questionnumber = 'QTN-01121' OR
QTN.klevr_questionnumber = 'QTN-01334' OR
QTN.klevr_questionnumber = 'QTN-01350' OR
QTN.klevr_questionnumber = 'QTN-01186' OR
QTN.klevr_questionnumber = 'QTN-01138'
)
Sub3

)
AS JOIN1 ON JOIN1.[activityid] = SUB2.[activityid]
```

```
SELECT SUBQRY2. * FROM (

SELECT 
SUBQRY1.*,
count(*) over(partition by [REFERENCE] )			          as 'COUNT',
ROW_NUMBER() OVER(PARTITION BY  [REFERENCE]	 ORDER BY [Question ID]	) AS [OCCURANCE]
FROM ( 


SELECT 
	   FRM.[klevr_title]						  			as  'FUND'		
	  ,FRM.[klevr_formnumber]					  			as  'Form ID'
	  ,APP.[klevr_applicationnumber]				  			as  'Application ID'
	  ,ASS.klevr_assessmentautonumber				  			as  'Assessment ID'
	  ,CON.[ws_contactid]						  			as  'Contact ID'
	  ,APP.[klevr_portalsubmissionstatuscodename]			 			as  'Status' 
	  ,APP.[ws_eligibilitystatusname]				  			as  'Eligibility'
      ,APP.[statecodename]						  			as  'APP State'
      ,APP.[statuscodename]						  			as  'APP Status'
	  ,ASS.[statecodename]						  			as  'ASS State'
	  ,ASS.klevr_assessoridname					  			as	'Assessor name'
	  ,ASS.[klevr_conflictresponsecodename]				  			as  'Confict'
	  ,ASS.[klevr_assessmenttypeidname]							as  'Internal'
	  ,CONVERT(VARCHAR(10), cast(ASS.modifiedon as date), 103)  as  'Date Modified'	
	  ,ASS.klevr_assessorrecommendationcodename						as	'Ass Status'
	  ,ASS.klevr_assessorrecommendationnotes						as	'Ass Notes'
	  ,QTN.klevr_questionnumber								as	'Question ID'
	  ,QTN.klevr_name									as	'Question Name'
	  ,RES.klevr_response									as	'Answer'

	  ,[REFERENCE] = CONCAT(APP.[klevr_applicationnumber],' | ',QTN.klevr_questionnumber)
	  ,[LINK]	   = CONCAT('https://prodkatoatoa.crm6.dynamics.com/api/data/v9.0/klevr_formresponses(',RES.klevr_formresponseid,')/klevr_file/$value')
	  ,ATT.[filename]
	  ,ATT.[filesizeinbytes]
										

  FROM [dbo].[klevr_application]			   APP
  left join [dbo].[contact]			as CON on CON.contactid				= APP.[klevr_applicant]
  left join [dbo].[klevr_form]			as FRM on FRM.klevr_formid			= APP.[klevr_formid]
  left join [dbo].[klevr_assessment]		as ASS on ASS.klevr_applicationid		= APP.klevr_applicationid
  left join [dbo].[klevr_formsubmission]    	as SUB on SUB.regardingobjectid			= APP.klevr_applicationid
  left join [dbo].[klevr_formresponse]		as RES on RES.klevr_formsubmissionid		= SUB.activityid
  left join	[dbo].[klevr_question]		as QTN on QTN.[klevr_questionid]		= RES.[klevr_questionid]
  left join [dbo].[fileattachment]		as ATT on ATT.[objectid]			= RES.klevr_formresponseid

  where 
  APP.[ws_eligibilitystatusname]		= 'Eligible'		and
  APP.[klevr_portalsubmissionstatuscodename]    = 'Submitted'		and
  ASS.[statecodename]				= 'Active'			 


) SUBQRY1
) SUBQRY2
WHERE [COUNT] >1
```




###### [LIBRARY](https://github.com/ScottypNZ/CODE-LIBRARY)   |   [INDEX](#INDEX)
-------------------------

### GENERAL
 
```SQL 

select CONVERT (date,convert(char(8),'202101010202'))
convert(date,vpn.LastModifiedDateTime,112) as LastModified

CREATE TABLE NEW SELECT * FROM DATA$;  
  
CREATE TABLE NEW([MAX] VARCHAR(255))   

SELECT * INTO NEW FROM  [dbo].[DATA$];   

ALTER TABLE [NEW] ADD [MAX] NVARCHAR(255);   

ALTER TABLE [DATA$ ALTER COLUMN FirstName NVARCHAR(255);   

UPDATE [NEW] SET [TEST] = 'X'   

DROP TABLE [DATA];  

DELETE FROM [DATA$];   

WHERE [MIAS DATE] IS NULL  
WHERE [MIAS DATE] ='20210720'   

FINANCIAL QUARTER
=case when DATEPART(quarter,RGT.LastModifiedDateTime) > 2 then FORMAT(DATEPART(quarter,RGT.LastModifiedDateTime)-2,'0#') 
else FORMAT(DATEPART(quarter,RGT.LastModifiedDateTime)+2,'0#') end as [QTR]

FORMAT AS TWO DIGITS / PAD TEXT
=FORMAT(DATEPART(quarter,RGT.LastModifiedDateTime)+2,'0#')

MAX RECORD ASSOCIATED WITH A FIELD IN A JOIN
= and VSH.Id = (select max(Id) from VesselStatusHistory where VesselId	= VES.Id group by VesselId)

IS THE CURRENT RECORD THE MAX ASSOCIATED WITH A VESSEL (ENTITY)
= CASE WHEN [occ] = min([occ]) OVER(PARTITION BY ves.[id]) THEN 'TRUE' ELSE 'FALSE' END [MAX] 

MAX IF, MAX OVER PARTITION
= MAX([Fin Year]) over(partition by [Limit Id]) as 'MAX',			

SELECT * FROM [LOCAL DATABASE].[dbo].[DATA$]    
SELECT COUNT (*) FROM [LOCAL DATABASE].[dbo].[DATA$]    
SELECT COUNT(DISTINCT [MIAS DATE]) FROM [LOCAL DATABASE].[dbo].[DATA$]    

select CAST(NULL as NVARCHAR(250)) as TEST, *  
INTO [LOCAL DATABASE].[dbo].[NEW]  
FROM [LOCAL DATABASE].[dbo].[DATA$];  

SELECT DISTINCT [MIAS DATE]   
FROM [LOCAL DATABASE].[dbo].[DATA]   
ORDER BY [MIAS DATE] DESC;   

SELECT DISTINCT[PASSENGERID],  
COUNT ([PassengerID]) as COUNT  
FROM [dbo].[DATA]  
GROUP BY [PassengerID]  
ORDER BY PassengerID ASC;  
```
MAX DATE ASSOCIATED WITH ID
```vba
SELECT [PASSENGERID],   
COUNT ([PassengerID]) as COUNT,   
MAX([MIAS DATE]) AS LATEST   
FROM [SECOND DATABASE].[dbo].[NEW]   
GROUP BY [PassengerID]   
ORDER BY PassengerID ASC;   
```
MAX/MIN DATE ASSOCIATED WITH ID USING IF RULE
```VBA
SELECT [Passengerid], 
COUNT ([PassengerID]) as COUNT,
MIN(CASE WHEN [passengerid] = [passengerid] THEN [MIAS DATE] ELSE 0 END) AS MIN,
MAX(CASE WHEN [passengerid] = [passengerid] THEN [MIAS DATE] ELSE 0 END) AS MAX
FROM [LOCAL DATABASE].[dbo].[DATA$]
Group by [passengerid]
ORDER BY PassengerID ASC;
```
SELECT DATE, COUNT, FORMAT AS NUMBER AND ADD TOTAL ROW VIA ROLLUP
```VBA
SELECT isnull ([MIAS DATE],'TOTAL') AS 'MIAS DATE', 
format(count (*), 'n0') as COUNT   
FROM [LOCAL DATABASE].[dbo].[DATA$]   
GROUP BY [MIAS DATE] with ROLLUP   
```
COUNT DISTINCT ID, REF, AND TOTAL
```VBA
SELECT
FORMAT(COUNT(DISTINCT [PassengerID]),'N0') AS 'Passenger Count', 
FORMAT(COUNT(DISTINCT [REFERENCE]),'N0') AS 'Ref Count',
FORMAT(COUNT (*),'N0') AS TOTAL
FROM [LOCAL DATABASE].[dbo].[DATA$]
ORDER BY [TOTAL] deSC;
```
LIST ALL COLUMN HEADINGS & LIST ALL COLUMN HEADINGS "LIKE"

```VBA
SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'DATA' ;  
SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'DATA' and column_name like '%DATE%';  
ALT+F1
```

### TABLE FIELDS  

ADD REFERENCE COLUMN

```sql
UPDATE [DATA$] SET [REFERENCE] = CONCAT(
[VoucherID],' | ',
[PassengerID],' | ',
[GROUPID],' | ',
[FirstName],' | ',
[OtherNames],' | ',
[LastName],' | ',
[PassportNumber],' | ',
[INZClientNumber],' | ',
[FlightID],' | ',
[Flight],' | ',
[ArrivalDate],' | ',
[RAWFLAGS]);

UPDATE [DATA$] SET [REFERENCE] = CONCAT(
[GROUPID],' | ',
[PassengerID],' | ',
[FirstName],' | ',
[OtherNames],' | ',
[LastName],' | ',
[PassportNumber],' | ',
[ArrivalDate],' | ',
[Flight],
[RAWFLAGS]);
```
CONVERT DATE TEST (SELECT ISSUES)
```SQL
	SELECT [MIAS DATE], [ARRIVAL]
	FROM [DATA$] 
	WHERE try_convert(DATE, [ARRIVALDATE]) is null and [ARRIVALDATE] is not null;
```
LIST FORMAT TYPES BASED ON SEARCH FOR / & - (POSSIBLY EXPAND TO INCLUDE SCHEMA)
```SQL
	SELECT DISTINCT([ArrivalDate]),
	CASE
	WHEN [ArrivalDate] is null THEN 'BLANK'
	WHEN CHARINDEX('/',[ArrivalDate]) > 0 THEN 'SLASH'
	ELSE 'NOSLASH'
	END as 'RESULT'
	FROM [LOCAL DATABASE].[dbo].[DATA$]
	ORDER BY [RESULT]
```
CONVERT TEXT IN VARIOUS FORMATS TO STANDARDISED DATE
```sql
ALTER TABLE [DATA$] 
drop column [ARRIVAL];

ALTER TABLE [DATA$] 
ADD [ARRIVAL] DATEtime NULL

  	UPDATE [DATA$]
	SET [ARRIVAL] = CASE
		WHEN CHARINDEX('/',[ArrivalDate]) > 0
		THEN CONVERT(datetime, [ArrivalDate], 103) 
		ELSE [ArrivalDate]
	END

	ALTER TABLE [DATA$] ALTER COLUMN [ARRIVAL] date NULL

	--- VALIDATION ---
  SELECT [MIAS DATE], [ArrivalDate], [ARRIVAL]
  FROM [DATA$]
  WHERE [ArrivalDate] is not null
```
DEDUPE:  ADD RUNNING COUNT OF REFERENCE, THEN FILTER BY FIRST OCCCURANCE

```SQL
SELECT SUBQRY.*
FROM
( SELECT ROW_NUMBER() OVER(PARTITION BY [REFERENCE] ORDER BY [PASSENGERID]) AS [REF OCCURANCE], *
  FROM [DATA$]
) SUBQRY
WHERE [REF OCCURANCE] = 1
```

RETURNS ID, REFERENCE, COUNT OF ID, COUNT OF REFERENCE, RUNNNING COUNT OF REF
THEN JOIN TABLE WITH DISTINCT COUNT OF REF/PASSENGERID

```SQL
select  QRY_CNTS.*, QRY_REF.[DISTINCT REF ID]
	
	FROM 
		    (SELECT TOP (500) 
			[REFERENCE], 
			[PASSENGERID],
			count(*) over(partition by [PASSENGERID] )			      as 'COUNTIF ID',
			ROW_NUMBER() OVER(PARTITION BY [PASSENGERID] ORDER BY [REFERENCE])    as 'OCCURANCE ID',
			count(*) over(partition by [REFERENCE] )		              as 'COUNTIF REF',  
			ROW_NUMBER() OVER(PARTITION BY [REFERENCE] ORDER BY [PASSENGERID])    as 'REF OCCURANCE'
			FROM [DATA$] 
			WHERE [PASSENGERID] = 10
			ORDER BY [PASSENGERID] ASC, 'OCCURANCE ID',  'REF OCCURANCE', 'COUNTIF REF'
			) QRY_CNTS

  LEFT JOIN (
  SELECT [PASSENGERID], COUNT(DISTINCT [REFERENCE]) AS [DISTINCT REF ID] 
  FROM [DATA$]
  GROUP BY [PASSENGERID]
		    ) 

  QRY_REF ON QRY_CNTS.[PASSENGERID] = QRY_REF.[PASSENGERID]
  ORDER BY [PASSENGERID] ASC

```
RETURNS ID, REFERENCE, COUNT OF ID, COUNT OF REFERENCE, RUNNNING COUNT OF REF DISTINCT COUNT OF REF/PASSENGERID WITHOUT JOINING

```SQL
SELECT TOP (500) 
[REFERENCE], 
[MIAS DATE],
[PASSENGERID],
count(*) over(partition by [PASSENGERID] )							as 'COUNTIF ID',
ROW_NUMBER() OVER(PARTITION BY [PASSENGERID] ORDER BY [REFERENCE])  as 'OCCURANCE ID',
count(*) over(partition by [REFERENCE] )							as 'COUNTIF REF',  
ROW_NUMBER() OVER(PARTITION BY [REFERENCE] ORDER BY [PASSENGERID])	as 'OCCURANCE REF',
(dense_rank()OVER(partition by [PASSENGERID] order by [REFERENCE] asc) +
dense_rank() OVER(partition by  [PASSENGERID] order by [REFERENCE] desc) -1) as 'DISTINCT REF COUNT',
dense_rank() OVER(partition by  [PASSENGERID] order by [REFERENCE]) as 'DISTINCT REF OCCURANCE'
from [DATA$]
WHERE [PASSENGERID] = 10
ORDER BY [PASSENGERID], [REFERENCE]
```
CREATE VIEW, REMOVING INVALID RECORDS FIRST, THEN ADDING MAX, THEN FILTERING BY TRUE 

```VBA
CREATE VIEW [VALID] AS
SELECT SUBQRY.*
FROM
( SELECT CASE WHEN [MIAS DATE] = MAX([MIAS DATE]) OVER(PARTITION BY [PASSENGERID]) THEN 'TRUE' ELSE 'FALSE' END [MAX BOOLEAN], *
  FROM [DATA$]
  WHERE [ARRIVAL] IS NOT NULL AND [FLIGHT] IS NOT NULL 
) SUBQRY
WHERE [MAX BOOLEAN] = 'TRUE'
```
CREATE VIEW WITH ALL COUNT IF VARIABLES

```VBA
CREATE VIEW [TEST] AS
SELECT
CASE WHEN [MIAS DATE] = MAX([MIAS DATE]) OVER(PARTITION BY [PASSENGERID]) THEN 'TRUE' ELSE 'FALSE' END [MAX BOOLEAN],
count(*) over(partition by [PASSENGERID] )							as 'COUNTIF ID',
ROW_NUMBER() OVER(PARTITION BY [PASSENGERID] ORDER BY [REFERENCE])  as 'OCCURANCE ID',
count(*) over(partition by [REFERENCE] )							as 'COUNTIF REF',  
ROW_NUMBER() OVER(PARTITION BY [REFERENCE] ORDER BY [PASSENGERID])	as 'OCCURANCE REF',
(dense_rank()OVER(partition by [PASSENGERID] order by [REFERENCE] asc) +
dense_rank() OVER(partition by  [PASSENGERID] order by [REFERENCE] desc) -1) as 'DISTINCT REF COUNT',
dense_rank() OVER(partition by  [PASSENGERID] order by [REFERENCE]) as 'DISTINCT REF OCCURANCE',
SUBQRY.*
FROM
( SELECT ROW_NUMBER() OVER(PARTITION BY [REFERENCE] ORDER BY [PASSENGERID]) AS [REF OCCURANCE], *
  FROM [DATA$]
) SUBQRY
WHERE [REF OCCURANCE] = 1
```
CREATE VIEW DISTINCT AND VALID
```SQL
CREATE VIEW [DISTINCT_AND_VALID] AS
SELECT SUBQRY.*
FROM
( SELECT ROW_NUMBER() OVER(PARTITION BY [REFERENCE] ORDER BY [PASSENGERID]) AS [REF OCCURANCE], *
  FROM [DATA$]
  WHERE [ARRIVAL] IS NOT NULL AND [Flight] IS NOT NULL
) SUBQRY
WHERE [REF OCCURANCE] = 1
```
RETURNS ID, UPLOAD DATE, MAX DATE ASSOCIATED WITH ID, BOOLEAN MAX DATE ASSOCIATED WITH ID
```SQL
/* MAX WITHOUT CASE */
CREATE VIEW [ID MAX] AS
SELECT [PASSENGERID], [MIAS DATE], 
MAX([MIAS DATE]) OVER(PARTITION BY [PASSENGERID]) AS [MAX DATE],
CASE WHEN [MIAS DATE] = MAX([MIAS DATE]) OVER(PARTITION BY [PASSENGERID]) THEN 'TRUE' ELSE 'FALSE' END [MAX BOOLEAN]
FROM [LOCAL DATABASE].[dbo].[DATA$]
where [PassengerID] = [PassengerID]
ORDER BY [PASSENGERID] ASC, [MIAS DATE] ASC
```
SELECT ALL WITH SCAN

```sql
Select [ScanTransportID] 
      ,[ScanTransportCity]
      ,[ScanTransportHotel]
      ,[ScanTransportOperator]
      ,[ScanTransportTime]
      ,[ScanTransportInteractionTime]
      ,[ScanTransportInteractionType]
      ,[ScanHotel]
      ,[ScanHotelInteractionTime]
      ,[ScanHotelInteractionType]
      ,[ScanHotelOperator]
      ,[ScanNumberOfRooms]
      ,[ScanRoomNumbers]
FROM [LOCAL DATABASE].[dbo].[DATA$];
```

```sql
CREATE TABLE [dbo].[NEW] (
[MAX] NVARCHAR (255) NULL,
[MIAS DATE] NVARCHAR (255) NULL,
[DATE] NVARCHAR (255) NULL,
[PassengerID] FLOAT (53) NULL,
[Status] NVARCHAR (255) NULL,
[VerificationStatus] NVARCHAR (255) NULL,
[PrimaryContact] FLOAT (53) NULL,
[FirstName] NVARCHAR (255) NULL,
[OtherNames] NVARCHAR (255) NULL,
[LastName] NVARCHAR (255) NULL,
[Gender] NVARCHAR (255) NULL,
[GenderDiverse] NVARCHAR (255) NULL,
[BirthDate] NVARCHAR (255) NULL,
[CountryOfDeparture] NVARCHAR (255) NULL,
[SpeakEnglish] NVARCHAR (255) NULL,
[LanguagesSpoken] NVARCHAR (255) NULL,
[OtherLanguage] NVARCHAR (255) NULL,
[Nationality] NVARCHAR (255) NULL,
[Email] NVARCHAR (255) NULL,
[NZ contact number] NVARCHAR (255) NULL,
[NZ contact number value] NVARCHAR (255) NULL,
[Other contact number] NVARCHAR (255) NULL,
[PassportNumber] NVARCHAR (255) NULL,
[PassportCountryCode] NVARCHAR (255) NULL,
[PassportIssuingAuthority] NVARCHAR (255) NULL,
[PassportDateOfIssue] NVARCHAR (255) NULL,
[PassportDateOfExpiry] NVARCHAR (255) NULL,
[NewZealandCitizen] NVARCHAR (255) NULL,
[NewZealandBornCitizen] NVARCHAR (255) NULL,
[NewZealandPermanentResident] NVARCHAR (255) NULL,
[AustralianCitizenOrPermanentResident] NVARCHAR (255) NULL,
[NewZealandTemporaryVisaHolder] NVARCHAR (255) NULL,
[PendingVisaStatus] NVARCHAR (255) NULL,
[NotAVisaHolder] NVARCHAR (255) NULL,
[VisaStatus] NVARCHAR (255) NULL,
[VisaDetail] NVARCHAR (255) NULL,
[VisaTemporaryOtherType] NVARCHAR (255) NULL,
[VisaTemporaryOtherTypeSpecified] NVARCHAR (255) NULL,
[Charges-DurationOfStay] NVARCHAR (255) NULL,
[Charges-DepartAfterAug11] NVARCHAR (255) NULL,
[Charges-ordinarilyOnMarch19] NVARCHAR (255) NULL,
[Charges-leftBeforeMarch19] NVARCHAR (255) NULL,
[INZClientNumber] NVARCHAR (255) NULL,
[KnownResidentialAddressInNewZealand] NVARCHAR (255) NULL,
[Contact_ApartmentOrStreetNumber] NVARCHAR (255) NULL,
[Contact_StreetName] NVARCHAR (255) NULL,
[Contact_Suburb] NVARCHAR (255) NULL,
[Contact_City] NVARCHAR (255) NULL,
[Contact_Postcode] NVARCHAR (255) NULL,
[TemporaryOrPermanentAddress] NVARCHAR (255) NULL,
[FinalArrivalDestinationInNewZealand] NVARCHAR (255) NULL,
[UserID] FLOAT (53) NULL,
[AllowedDuplicateVouchers] NVARCHAR (255) NULL,
[CreatedAt] DATETIME NULL,
[UpdatedAt] DATETIME NULL,
[GroupID] FLOAT (53) NULL,
[GroupName] NVARCHAR (255) NULL,
[NumberOfPassengersInGroup] FLOAT (53) NULL,
[PreferredNumberOfRooms] FLOAT (53) NULL,
[HotelRoomAdjoining] NVARCHAR (255) NULL,
[HotelRoomPreferredTypes] NVARCHAR (255) NULL,
[HotelRoomAccessibilityRequirements] NVARCHAR (255) NULL,
[HotelRoomSpecialRequests] NVARCHAR (255) NULL,
[DietaryRequirements] NVARCHAR (255) NULL,
[VoucherID] NVARCHAR (255) NULL,
[VoucherLastSent] DATETIME NULL,
[MinorHasParentOrGuardian] NVARCHAR (255) NULL,
[UnaccompaniedMinor] NVARCHAR (255) NULL,
[BookingID] NVARCHAR (255) NULL,
[Hotel] NVARCHAR (255) NULL,
[HotelRoomID] NVARCHAR (255) NULL,
[HotelRoom] NVARCHAR (255) NULL,
[HotelRoomType] NVARCHAR (255) NULL,
[HotelCheckIn] NVARCHAR (255) NULL,
[HotelCheckOut] NVARCHAR (255) NULL,
[HotelCity] NVARCHAR (255) NULL,
[NumberOfNights] NVARCHAR (255) NULL,
[Airline] NVARCHAR (255) NULL,
[AirlineBookingReference] NVARCHAR (255) NULL,
[FlightID] NVARCHAR (255) NULL,
[Flight] NVARCHAR (255) NULL,
[FlightDepartureTime] NVARCHAR (255) NULL,
[FlightDepartureCity] NVARCHAR (255) NULL,
[FlightArrivalTime] NVARCHAR (255) NULL,
[FlightArrivalAirport] NVARCHAR (255) NULL,
[ArrivalDate] NVARCHAR (255) NULL,
[Notes] NVARCHAR (MAX) NULL,
[Registration declarations] NVARCHAR (255) NULL,
[TentativeReleaseDate] NVARCHAR (255) NULL,
[PassengerBucket] NVARCHAR (255) NULL,
[GroupBucket] NVARCHAR (255) NULL,
[RawFlags] NVARCHAR (255) NULL,
[BulkUploadNotes] NVARCHAR (255) NULL,
[Vaccinated] NVARCHAR (255) NULL,
[AuthoriseToValidateInformation] DATETIME NULL,
[Authorisation checkbox] NVARCHAR (255) NULL,
[ScanTransportID] NVARCHAR (255) NULL,
[ScanTransportCity] NVARCHAR (255) NULL,
[ScanTransportHotel] NVARCHAR (255) NULL,
[ScanTransportOperator] NVARCHAR (255) NULL,
[ScanTransportTime] NVARCHAR (255) NULL,
[ScanTransportInteractionTime] NVARCHAR (255) NULL,
[ScanTransportInteractionType] NVARCHAR (255) NULL,
[ScanHotel] NVARCHAR (255) NULL,
[ScanHotelInteractionTime] NVARCHAR (255) NULL,
[ScanHotelInteractionType] NVARCHAR (255) NULL,
[ScanHotelOperator] NVARCHAR (255) NULL,
[ScanNumberOfRooms] NVARCHAR (255) NULL,
[ScanRoomNumbers] NVARCHAR (255) NULL
);
```

### MARITIME

UNION WHERE COLUMNS INCONSISTENT

```VBA
select 
	TypeName as [Type_Name],
	code as ORG_Code,
	[status] as [Status],
	active_from_datetime_local as Active_From,
    active_to_datetime_local as Active_To,
	generated_name as OrganisationName,
	[Organisation_OrganisationSection_CRM_Customer_ID] as CRM_ID,
    [Organisation_OrganisationSection_Solomon_ID] as SOLOMON_ID,
    [Organisation_OrganisationSection_f_org_nzbn] as NZBN_ID,
	[created_by] as Created_by,
	[updated_by] as Updated_by,
	[created_datetime_local] as Created_Date,
	[updated_datetime_local] as Updated_Date
from
	[ReportView].[Organisation_Charitable Trust]
where
	IsCurrent=1

union all

select 
	TypeName,
	code as ORGCode,
	[status] as [Status],
	active_from_datetime_local as ActiveFrom,
    active_to_datetime_local as ActiveTo,
	generated_name as OrganisationName,
	[Organisation_OrganisationSection_CRM_Customer_ID] as CRM_ID,
    [Organisation_OrganisationSection_Solomon_ID] as SOLOMON_ID,
    NULL as [Organisation_OrganisationSection_f_org_nzbn] ,
	[created_by],
	[updated_by],
	[created_datetime_local],
	[updated_datetime_local]

from
	[ReportView].[Organisation_Maori Trust Board]
where
	IsCurrent=1
;
```

UNION WITH COUNT IF SUBQUERY
```VBA
SELECT * 
FROM
	(
		SELECT *, 
		ROW_NUMBER() OVER(PARTITION BY [VesselId] ORDER BY [Id] desc) as [OCCURANCE],
		count(*) over(partition by [VesselId]) as [COUNT]
		FROM
		  (
				SELECT TOP (1000) 
				[VesselId],
				[PreviousName] as NAME,
				[Id],
				CONVERT(date,[LastModifiedDateTime],112) as LastModified,
				[IsMigrated]
				FROM [Poseidon_Navigator].[dbo].[VesselPreviousName] vpn
				
		union all

				SELECT TOP (1000)
				[Id] as VesselId,
				[Name],
				100000 as [Id] ,
				CONVERT(date,[LastModifiedDateTime],112) as LastModified,
				[IsMigrated]
				FROM [Poseidon_Navigator].[dbo].[Vessel]
			) 
			SUB   
	) 
FTR
WHERE [COUNT] > 1
ORDER BY [VesselId] asc, [OCCURANCE] asc
```

JOIN WITH THREE SUBQUERIES, FILTERING OUT DUPLICATES THEN INDEX REMAINING DATA
```VBA
	SELECT VesselId, GrossTonnage, NAME, PREVIOUS, UpdateID, Lastmodified, [YEAR] FROM
	(
		SELECT *, 
		count(*) over(partition by [YEAR]) as [YearCount],
		count(*) over(partition by [VesselId]) as [COUNT],
		ROW_NUMBER() OVER(PARTITION BY [VesselId] ORDER BY [UpdateID] desc) as [OCCURANCE]   
		FROM
			(  
			   SELECT *,
			   YEAR(LastModified) as [YEAR],
			   CASE WHEN [NAME] = [PREVIOUS] THEN 'TRUE' ELSE 'FALSE' END as [MATCH]
			   FROM
					 (    
						  
						SELECT 
						v.[Id] as VesselId,
						v.GrossTonnage,
						v.[Name] as NAME,
						vpn.PreviousName as PREVIOUS,
						vpn.Id as UpdateID,
						convert(date,vpn.LastModifiedDateTime,112) as LastModified
						FROM [Poseidon_Navigator].[dbo].[Vessel] v
						inner join VesselPreviousName vpn on v.[Id] = vpn.[VesselId]	
					 ) 
				SUB1
				WHERE [NAME] <> [PREVIOUS]
			  --L1 is a simple join between Vessel and Vessel Previous Name
			  )
		 SUB2
	   --L2 Adds in year, 'MATCH' which shows name change errors, COUNT which shows number of previous names, OCCURANCE which shows a running count of the Vessel IDs so that only the most recent can be filtered out
	)
SUB3
--L3 Counts the YEAR, this is so you can see if there are any issues in the relevant year of report
  
-- This can then be filtered by year, Tonnage and any other data that you may need to join.
-- Where LastModified > '2020-01-01' and GrossTonnage is not null and GrossTonnage >= 100		

--from Vessel v
--join SafetyCertificationLookup sc on sc.id=v.SafetyCertificationLookupid
--join VesselStatusHistory vsh on v.id=vsh.Vesselid
--and vsh.Id = (select max(Id) from VesselStatusHistory where VesselId = v.Id group by VesselId)
--join VesselStatusLookup vs on vsh.VesselStatusLookupid=vs.id
--where
--v.GrossTonnage >=100
--and vs.name='Active'
--and sc.Name<>'Registered Pleasure'
--order by sc.Name,v.id
```

LIST TABLE COLUMNS AND NUMBERS
```VBA
select * into ##tab1 from 
(
	select *, 
	count(*) over(partition by BillName) as [COUNT ALL]

	from 
(

	SELECT       [CpnyID] = 'MSA',
				 c.CustId, 
				 [InUse] = CASE WHEN a.LastInvcDate IS NULL THEN 'N' WHEN a.LastInvcDate < DATEADD(Year, - 2, GETDATE()) THEN 'N' ELSE 'Y' END,
				 [FLDB] = CASE WHEN ARD.Crtd_Prog IS NULL THEN 'N' ELSE 'Y' END,
				 convert(date,a.LastInvcDate,112) as InvDate,
				 convert(date,a.LUpd_DateTime,112) as Updated,
				 c.BillName,
				 a.CurrBal
	FROM         SolomonMSAApp.dbo.Customer c 
				 LEFT OUTER JOIN SolomonMSAApp.dbo.AR_Balances a ON a.CustID = c.CustId
				 LEFT JOIN	(SELECT max(Crtd_Prog) as Crtd_Prog, CustId, MAX(BatNbr) AS BatNbr FROM ARDoc WHERE CustId <>'' and [Crtd_Prog] = 'FLDB_SQL'  GROUP BY CustId ) ARD ON  ARD.CustId = c.CustId

	)SUB1
	
)
SUB2
ORDER BY [COUNT ALL] DESC, InUse desc



select *, 
count(*) over(partition by BillName) as [COUNT YES] into  ##tab2
from 
	(
	select  c.CustId, BillName, [InUse] = CASE WHEN a.LastInvcDate IS NULL THEN 'N' WHEN a.LastInvcDate < DATEADD(Year, - 2, GETDATE()) THEN 'N' ELSE 'Y' END
	from SolomonMSAApp.dbo.Customer c
	LEFT OUTER JOIN SolomonMSAApp.dbo.AR_Balances a ON a.CustID = c.CustId
	)
	SUB3
where [InUse] = 'y'


----------------

select *, 
count(*) over(partition by BillName) as [COUNT NO] into  ##tab3
from 
	(
	select  c.CustId, BillName, [InUse] = CASE WHEN a.LastInvcDate IS NULL THEN 'N' WHEN a.LastInvcDate < DATEADD(Year, - 2, GETDATE()) THEN 'N' ELSE 'Y' END
	from SolomonMSAApp.dbo.Customer c
	LEFT OUTER JOIN SolomonMSAApp.dbo.AR_Balances a ON a.CustID = c.CustId
	)
	SUB4
where [InUse] = 'N'

----------------

select distinct t1.*, t2.[COUNT YES], t3.[COUNT NO]
from ##tab1 t1
inner join ##tab2 t2 on t1.BillName = t2.BillName
inner join ##tab3 t3 on t1.BillName = t3.BillName
order by t1.[COUNT ALL] desc, BillName, InUse desc

drop table ##tab1
drop table ##tab2
drop table ##tab3
```

LIST TABLES AND NUMBERS
```VBA
SELECT
    TAB.name as Table_Name, 
    COL.name as Column_Name,
	COL.Column_Id as Column_No,
    COL.Max_length,
	format(SIC.rowcnt,'n0') as RowCnt,
	SIC.rowcnt as rowsort
FROM 			sys.tables			as TAB
LEFT JOIN 		sys.columns			as COL  on TAB.object_id 		= COL.object_id
LEFT JOIN		sysindexes			as SIC  on SIC.Id				= TAB.object_id
WHERE indid = 1 and TAB.Name not like '%audit_%'
order by rowsort DESC
```

LIST USER VIEWS
```VBA
SELECT * FROM tempdb.sys.objects
WHERE type = 'U'
ORDER BY NAME DESC
```

MARITIME HISTORY JOIN WITH MAX DATES
```VBA
	SELECT * FROM
	(
		SELECT 
		 VES.[Id] as [MNZ Number]
		,VES.[Name] as [MNZ Name]
		,SCL.Name as [SafetyCertification]
		,VES.[OverallLengthInMetres]
		,VSL.Name as [Status]
		,VSH.LastModifiedDateTime as [Modifed On]
		,YEAR(VSH.LastModifiedDateTime) AS	DATE
		,USR.Fullname

		,ROW_NUMBER() over (partition by VesselId order by VSH.Id desc) as OCC
		,count(*) over(partition by VesselId) as COUNT 

		,MAX(VSH.LastModifiedDateTime) OVER(PARTITION BY VES.[Id]) AS MAX

		,CASE WHEN (MONTH(VSH.[LastModifiedDateTime]))  <=6 THEN convert(varchar(4),
		 YEAR(VSH.[LastModifiedDateTime])-1)  + '-' + convert(varchar(4), YEAR(VSH.[LastModifiedDateTime])%100)    
		 ELSE convert(varchar(4),YEAR(VSH.[LastModifiedDateTime]))+ '-' + convert(varchar(4),
		 (YEAR(VSH.[LastModifiedDateTime])%100)+1)END AS [FINANCIAL YEAR]

		,CONCAT_WS('-',YEAR(MAX(VSH.LastModifiedDateTime) OVER(PARTITION BY VES.[Id])),FORMAT(MONTH(MAX(VSH.LastModifiedDateTime) OVER(PARTITION BY VES.[Id])),'00')) AS 'MAX MONTH'

		FROM 
		[Poseidon_Navigator].[dbo].[Vessel] 				VES
		left join SafetyCertificationLookup 				SCL on VES.SafetyCertificationLookupId 	= SCL.Id
		left join VesselStatusHistory						VSH on VES.Id							= VSH.VesselId
		left join VesselStatusLookup						VSL on VSH.VesselStatusLookupid			= VSL.Id
		left join UserSecurity								USR on USR.UserName						= VSH.CreatedByUserName
		
	) sub
	where count  > 1
```

MERGE TWO TABLES, WITH THE MOST RECENT RECORD AS CURRENT, SECOND AS PREVIOUS, FILTERING OUT DUPLICATES AND NO CHANGE
```VBA
	SELECT [MNZ Number], [MNZ Name], [SafetyCertification], [OverallLengthInMetres],  [Current Status], [Previous Status], [Modified By], [Modified On], [Fin Year]

	FROM
	(
		--- ALL VESSELES WITH CURRENT STATUS LOOKUP ---
				 SELECT 
				 VES.[Id] as [MNZ Number]
				,VES.[Name] as [MNZ Name]
				,SCL.Name as [SafetyCertification]
				,VES.[OverallLengthInMetres]
				,VSL.Name as [Current Status]
				,HISTORY.[Previous Status]
				,HISTORY.[Modified By]
				,CONVERT(NVarchaR,HISTORY.[Modifed On],103) AS [Modified On]
				,HISTORY.OCC
				,CASE WHEN [occ] = min([occ]) OVER(PARTITION BY ves.[id]) THEN 'TRUE' ELSE 'FALSE' END [MAX] 

				
				,CASE WHEN (MONTH(HISTORY.[Modifed On]))  <=6 THEN convert(varchar(4),
				 YEAR(HISTORY.[Modifed On])-1)  + '-' + convert(varchar(4), YEAR(HISTORY.[Modifed On])%100)    
				 ELSE convert(varchar(4),YEAR(HISTORY.[Modifed On]))+ '-' + convert(varchar(4),
				 (YEAR(HISTORY.[Modifed On])%100)+1)END AS [Fin Year]

				FROM 
				[Poseidon_Navigator].[dbo].[Vessel] 				VES
				left join SafetyCertificationLookup 				SCL on VES.SafetyCertificationLookupId 	= SCL.Id
				join VesselStatusHistory							VSH on VES.Id							= VSH.VesselId
				and VSH.Id = (select max(Id) from VesselStatusHistory where VesselId						= VES.Id group by VesselId)
				join VesselStatusLookup								VSL on VSH.VesselStatusLookupid			= VSL.Id

		RIGHT JOIN 
		(
		SELECT * FROM
			(
			--- VESSEL WITH A PREVIOUS STATUS ---
							select 
							VSH.VesselId,
							VSL.Name as [Previous Status],
							VSH.LastModifiedDateTime as [Modifed On],
							USR.FullName [Modified By],
							ROW_NUMBER() over (partition by VesselId order by VSH.Id desc) as OCC,
						    CONCAT_WS('-',YEAR(MAX(VSH.LastModifiedDateTime) OVER(PARTITION BY VSH.VesselId)),FORMAT(MONTH(MAX(VSH.LastModifiedDateTime) OVER(PARTITION BY VSH.VesselId)),'00')) AS 'MAX MONTH'
							from VesselStatusHistory VSH
							left join dbo.VesselStatusLookup VSL on VSH.VesselStatusLookupId = VSL.Id	
							left join UserSecurity			 USR on USR.UserName			 = VSH.CreatedByUserName
			)
		SUB
		WHERE OCC > 1 
		)
		as HISTORY on VES.ID	=	HISTORY.VesselId
	)
	SUB2
	WHERE [Current Status] <> [Previous Status] 
	AND  ([Current Status] LIKE 'Active' OR [Previous Status] LIKE 'Active') 
	AND MAX = 'TRUE'
	ORDER BY [MNZ Number], [FIN YEAR] DESC
```


AS ABOVE BUT WITH FULL DATA, FILTER OUT SINGLES.
```VBA
	select * from
	(
		SELECT 
		 VES.[Id] as [MNZ Number]
		,VES.[Name] as [MNZ Name]
		,SCL.Name as [SafetyCertification]
		,VES.[OverallLengthInMetres]
		,VSL.Name as [Current Status]
		,USR.Fullname as [Modified By]
		,CONVERT(NVarchaR,vsh.LastModifiedDateTime,103) AS [Modified On]

		,CASE WHEN (MONTH(VSH.[LastModifiedDateTime]))  <=6 THEN convert(varchar(4),
		 YEAR(VSH.[LastModifiedDateTime])-1)  + '/' + convert(varchar(4), YEAR(VSH.[LastModifiedDateTime])%100)    
		 ELSE convert(varchar(4),YEAR(VSH.[LastModifiedDateTime]))+ '/' + convert(varchar(4),
		 (YEAR(VSH.[LastModifiedDateTime])%100)+1)END AS [FIN YEAR]

		,CONCAT_WS('-',YEAR(VSH.LastModifiedDateTime),FORMAT(MONTH(VSH.LastModifiedDateTime),'00') ) AS 'MONTH'

		,ROW_NUMBER() over (partition by VesselId order by VSH.Id desc) as OCC
		,count(*) over(partition by VesselId) as COUNT 

		FROM 
		[Poseidon_Navigator].[dbo].[Vessel] 				VES
		left join SafetyCertificationLookup 				SCL on VES.SafetyCertificationLookupId 	= SCL.Id
		left join VesselStatusHistory						VSH on VES.Id							= VSH.VesselId
		left join VesselStatusLookup						VSL on VSH.VesselStatusLookupid			= VSL.Id
		left join UserSecurity								USR on USR.UserName						= VSH.CreatedByUserName
		
	) sub
	where count  > 1 
	--AND [MNZ Number] = '101445' AND [FIN YEAR] = '2021/22'
```


MARITIME METRICS, FILTERING OUT DUPLICATES
```VBA
	
	select distinct
	v.Id					as 'MNZ Id',
	v.[Name]				as 'MNZ Name',
	sc.[Name]				as 'Safety Certification',
	av.OverallLengthInMetres		as 'New LOA',
	prev.OverallLengthInMetres		as 'Previous LOA',
	av.GrossTonnage				as 'New GT',
	prev.GrossTonnage			as 'Previous GT',
	av.DeadweightTonnage			as 'New DWT',
	prev.DeadweightTonnage			as 'Previous DWT',
	usr.FullName				as 'Updated By',
	av.[Modified On]			as 'Updated On',

	CASE WHEN (MONTH(AV.[Modified On]))  <=6 THEN convert(varchar(4),
			 YEAR(AV.[Modified On])-1)  + '/' + convert(varchar(4), YEAR(AV.[Modified On])%100)    
			 ELSE convert(varchar(4),YEAR(AV.[Modified On]))+ '/' + convert(varchar(4),
			 (YEAR(AV.[Modified On])%100)+1)END AS [Fin Year]

	from Vessel v
	join 
	(
				select 
				VesselId,
				OverallLengthInMetres,
				GrossTonnage,
				DeadweightTonnage,
				LastModifiedByUserName,
				CONVERT(NVarchaR,LastModifiedDateTime,111) AS [Modified On],
				UpdateId,
			    MAX(UpdateId) OVER(PARTITION BY [VesselId]) as [Max] 
			  --MAX(convert(nvarchar, lastmodifieddatetime, 111)) OVER(PARTITION BY [VesselId]) AS [MAX]
				from Audit_Vessel
	) 
	as av on av.VesselId	=	v.Id

	left join 
	(
				select
				VesselId,
				OverallLengthInMetres,
				GrossTonnage,
				DeadweightTonnage,
				LastModifiedByUserName,
				LastModifiedDateTime,
				UpdateId
				from Audit_Vessel
	) 
	as prev on v.Id = prev.VesselId and prev.updateid = av.updateid - 1

	join UserSecurity usr on usr.UserName=av.LastModifiedByUserName
	join SafetyCertificationLookup sc on sc.Id=v.SafetyCertificationLookupId
 
	WHERE 

	(
	   av.OverallLengthInMetres<>prev.OverallLengthInMetres
	or av.DeadweightTonnage<>prev.DeadweightTonnage
	or av.GrossTonnage <> prev.GrossTonnage
	)
	ORDER BY [MNZ Id], [FIN YEAR] DESC
```
MARITIME METRICS, FILTERING OUT DUPLICATES, AND RETURNING THE LATEST RECORD (ALSO MAY WANT TO DO ALL, AND FILTER BY YEAR)
```VBA
	
	select distinct
	v.Id,
	v.[Name]					as 'MNZ Name',
	sc.[Name]					as 'Safety Certification',
	av.OverallLengthInMetres	as 'New LOA',
	prev.OverallLengthInMetres	as 'Previous LOA',
	av.GrossTonnage				as 'New GT',
	prev.GrossTonnage			as 'Previous GT',
	av.DeadweightTonnage		as 'New DWT',
	prev.DeadweightTonnage		as 'Previous DWT',
	usr.FullName				as 'Updated By',
	av.[Modified On]			as 'Updated On',

	CASE WHEN (MONTH(AV.[Modified On]))  <=6 THEN convert(varchar(4),
			 YEAR(AV.[Modified On])-1)  + '/' + convert(varchar(4), YEAR(AV.[Modified On])%100)    
			 ELSE convert(varchar(4),YEAR(AV.[Modified On]))+ '/' + convert(varchar(4),
			 (YEAR(AV.[Modified On])%100)+1)END AS [Fin Year]

	from Vessel v
	join 
	(
				select 
				VesselId,
				OverallLengthInMetres,
				GrossTonnage,
				DeadweightTonnage,
				LastModifiedByUserName,
				CONVERT(NVarchaR,LastModifiedDateTime,111) AS [Modified On],
				UpdateId,
			    MAX(UpdateId) OVER(PARTITION BY [VesselId]) as [Max] 
			  --MAX(convert(nvarchar, lastmodifieddatetime, 111)) OVER(PARTITION BY [VesselId]) AS [MAX]
				from Audit_Vessel
	) 
	as av on av.VesselId	=	v.Id

	left join 
	(
				select
				VesselId,
				OverallLengthInMetres,
				GrossTonnage,
				DeadweightTonnage,
				LastModifiedByUserName,
				LastModifiedDateTime,
				UpdateId
				from Audit_Vessel
	) 
	as prev on v.Id = prev.VesselId and prev.updateid = av.updateid - 1

	join UserSecurity usr on usr.UserName=av.LastModifiedByUserName
	join SafetyCertificationLookup sc on sc.Id=v.SafetyCertificationLookupId
 
	WHERE 
	av.[Max] = av.UpdateId
	and
	(
	   av.OverallLengthInMetres<>prev.OverallLengthInMetres
	or av.DeadweightTonnage<>prev.DeadweightTonnage
	or av.GrossTonnage <> prev.GrossTonnage
	)
	ORDER BY ID, [FIN YEAR] DESC

```

FILTER BY MAX FINANCIAL YEAR
```VBA	
	Select * from
	(
	SELECT	  VES.[Id] as [MNZ Number],
			  VES.[NAME] as [MNZ Name],
			  SCL.Name as [SafetyCertification],
			  CONVERT(date,VES.[CreatedDateTime]) as [Created On],
			  CASE WHEN (MONTH(VES.[CreatedDateTime]))  <=6 THEN convert(varchar(4), YEAR(VES.[CreatedDateTime])-1)  + '/' + convert(varchar(4), YEAR(VES.[CreatedDateTime])%100)    
			  ELSE convert(varchar(4),YEAR(VES.[CreatedDateTime]))+ '/' + convert(varchar(4), (YEAR(VES.[CreatedDateTime])%100)+1)
			  END AS [Fin Year],
			  'CREATED' AS [TYPE]

			  From Vessel VES
			  left join SafetyCertificationLookup 				SCL on VES.SafetyCertificationLookupId 	= SCL.Id
	)
	SUB
	where [SafetyCertification] <> 'Registered Pleasure' 

	and [Fin Year] in 
	(	
	SELECT MAX ([Fin Year]) from
		(
		SELECT	  CASE WHEN (MONTH(VES.[CreatedDateTime]))  <=6 THEN convert(varchar(4), YEAR(VES.[CreatedDateTime])-1)  + '/' + convert(varchar(4), YEAR(VES.[CreatedDateTime])%100)    
				  ELSE convert(varchar(4),YEAR(VES.[CreatedDateTime]))+ '/' + convert(varchar(4), (YEAR(VES.[CreatedDateTime])%100)+1)
				  END AS [Fin Year]
				  from Vessel VES
		)
		SUB1
	)	
```

FILTER OUT DUPLICATES USING CREATED REFERENCE
```VBA

SELECT * FROM
(
	SELECT *
	,COUNT(*) over(partition by SUB3.LimitId) as [CNT]
	,count(case when SUB3.FitASPly like '%passenger%' then SUB3.limitid end ) over(partition by SUB3.LimitId) as PASS 
	,MAX(SUB3.[Fin Year]) OVER(PARTITION BY SUB3.LimitId) AS [MAX YEAR]
	 FROM 
			(
			SELECT *
			,ROW_NUMBER() over (Partition by SUB2.LimitId order by SUB2.RecordID DESC) as OCC_RANK
			FROM 
				(
				SELECT *
				,ROW_NUMBER() over (Partition by SUB1.REF order by SUB1.LimitId desc, sub1.recordid ASC) as OCC_REF 
				FROM
					(
					SELECT 									  
					AVL.VesselId,
					OLT.[Name]                                             as LimitType,
					AVL.VesselOperatingLimitLinkId                         as LimitId,
					AVL.id                                                 as RecordID,
					FPT.[Name]                                             as FitAsPly,
					AVL.MaximumNumberOfPassengers						   as Pax,
					AVL.MinimumNumberOfCrew								   as Crew,
					VOL.MaximumNumberOfPersons                             as Pers,

					case when AVL.AuditTypeInd='D' then 'Remove' else case when AVL.AuditTypeInd='U' then 'Ammend' else 'New' end end as 'Change Type',

					USR.FullName,     

					CONVERT(NVarchaR,AVL.LastModifiedDateTime,103)		   as [Modified On],
					CONVERT(NVarchaR,AVL.CreatedDateTime,103)			   as [Created On],

					CASE WHEN (MONTH(AVL.LastModifiedDateTime))  <=6 
					THEN convert(varchar(4), YEAR(AVL.LastModifiedDateTime)-1)  + '/' + convert(varchar(4), YEAR(AVL.LastModifiedDateTime)%100)    
					ELSE convert(varchar(4),YEAR(AVL.LastModifiedDateTime))+ '/' + convert(varchar(4), (YEAR(AVL.LastModifiedDateTime)%100)+1)
					END													   as [Fin Year]

					,CONCAT(AVL.VesselId,' | ',OLT.[Name],' | ',AVL.VesselOperatingLimitLinkId,' | ',FPT.[Name],' | ',ISNULL(AVL.MaximumNumberOfPassengers,'0'),' | ',ISNULL(AVL.MinimumNumberOfCrew,'0'),' | ',ISNULL(AVL.MaximumNumberOfPersons,'0')) AS REF

					,AVL.UpdateId                                           as UpdatedId

					,ROW_NUMBER() over (Partition by AVL.VesselId, OLT.[Name], AVL.id order by AVL.VesselId DESC, AVL.VesselOperatingLimitLinkId DESC, AVL.id DESC) as OCC_LMT

					FROM Audit_VesselOperatingLimitLink AVL
					left join OperatingLimitTypeLookup		olt on OLT.id					= AVL.OperatingLimitTypeLookupId
					left join FitToPlyAsTypeLookup			fpt on FPT.id					= AVL.FitToPlyAsTypeLookupId
					left join UserSecurity					usr on USR.UserName				= AVL.LastModifiedByUserName
					left join VesselVesselCategoryLink		VVL ON VVL.VesselId				= AVL.VesselId
					left join VesselTypeLookup				VTL ON VTL.ID					= VVL.VesselTypeLookupId
					left join VesselOperatingLimitLink		VOL ON VOL.ID					= AVL.VesselOperatingLimitLinkId

					)SUB1
					WHERE OCC_LMT = 1 
					-- REMOVES DUPLICATES CAUSED BY NON CORE CHANGES SUCH AS DESCRIPTION (SAME RECORD ID)
			
				)SUB2
				WHERE OCC_REF = 1
				-- REMOVES DUPLICATES CAUSED BY NON CORE CHANGES SUCH AS DESCRIPTION (DIFFERENT RECORD ID)

			)SUB3
			WHERE OCC_RANK  < 3 
			-- REMOVES ONLY THE CURRENT AND PREVIOUS RECORD
		
		)SUB4
		-- REMVOES RECORDS WHERE THERE ISN'T A PASSENGER RECORD
		WHERE PASS > 0	AND vesselid = '100098'
		ORDER BY VesselId ASC, LimitId ASC, RecordID DESC
```
PASSENGER NUMBER BY TYPE
```VBA
		SELECT 
		VES.[Id]									as [VesselID],
		VES.[Name]									as [Name],
		SCL.Name									as [Safety Certification],		
		FTP.NAME									as [Fit to Ply],
		OLT.[Name]                                  as [LimitType],
		VOL.MaximumNumberOfPassengers				as [Max Pass],
		VOL.MaximumNumberOfPersons					as [Max Per],
		VOL.MinimumNumberOfCrew						as [Max Crew],
		convert(date,VSL.LastModifiedDateTime,112)  as [Last Modified],	
		VSL.NAME									as [Status]

		FROM [Poseidon_Navigator].[dbo].[Vessel] VES

		 LEFT join VesselOperatingLimitLink	         VOL on VES.id						= VOL.VesselID 
		 AND VOL.Id = (select max(Id) from VesselOperatingLimitLink where VesselId	= VES.Id group by VesselId)

		 LEFT join VesselStatusHistory				 VSH on VES.Id						= VSH.VesselId
		 and VSH.Id = (select max(Id) from VesselStatusHistory where VesselId		= VES.Id group by VesselId)

		 LEFT join VesselStatusLookup				 VSL on VSH.VesselStatusLookupid	= VSL.Id
		 LEFT join FitToPlyAsTypeLookup				 FTP on FTP.id						= VOL.FitToPlyAsTypeLookupId
		 LEFT join SafetyCertificationLookup		 SCL on SCL.id						= VES.SafetyCertificationLookupid
		 LEFT join UserSecurity						 USR on USR.UserName				= VOL.LastModifiedByUserName
		 LEFT join OperatingLimitTypeLookup			 OLT on OLT.id                      = VOL.OperatingLimitTypeLookupId
```

CERFIFICATE HYPERLINKS
```VBA
	   select 
	   VES.[Id]												as [MNZ Number]
	  ,APP.ID												as [Application ID]
	  ,CRT.Id												as [Certificate ID]
	  ,CSH.Id												as [Record ID]
	  ,VES.NAME												as [MNZ Name]
	  ,CTL.NAME												as [Cert Name]
	  ,CSL.Name												as [Status]
	  ,[OwnersAtDateOfIssue]								as [Owners At Issue]
	  ,ATD.Meridio_DocumentId								as [Meridio ID]
	  ,USC.FullName											as [Created By]
	  ,USM.FullName											as [Modified By]

	  ,convert(date,CRT.ValidFromDate,112)					as [Valid From Date]  
	  ,convert(date,CRT.ExpiryDueDate,112)					as [Expiry Due Date] 
	  ,convert(date,CSH.LastModifiedDateTime,112)			as [Modified Date Time]

	  ,CASE WHEN (MONTH(CSH.[LastModifiedDateTime]))  <=6 THEN convert(varchar(4),
		 YEAR(CSH.[LastModifiedDateTime])-1)  + '-' + convert(varchar(4), YEAR(CSH.[LastModifiedDateTime])%100)    
		 ELSE convert(varchar(4),YEAR(CSH.[LastModifiedDateTime]))+ '-' + convert(varchar(4),
		 (YEAR(CSH.[LastModifiedDateTime])%100)+1)END AS [FY Year]

	  ,replace(reverse(left(LTRIM(reverse(REPLACE(TRANSLATE([DocumentName], 'abcdefghijklmnopqrstuvwxyz+()-,#+&;/\_.:', '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'), '@', ''))),8)),' ','')  as [Doc Date]
	  ,CONCAT('http://mnz-16-app01-p.maritime.local/Poseidon/Datacom/DocumentServices/ViewDocument.aspx?docId=','',ATD.Meridio_DocumentId) as Link

	   FROM [Poseidon_Navigator].[dbo].[Vessel]		    VES
	   join SafetyCertificationLookup					SCL on SCL.id							= VES.SafetyCertificationLookupiD
	   join Application									APP on APP.ParentObjectPrimaryKeyId		= VES.Id
	   join ApplicationTypeLookup						ATL	on ATL.ID							= APP.ApplicationTypeLookupId
	   Join Certificate									CRT on CRT.ApplicationId				= APP.Id
	   join CertificateTypeLookup						CTL on CTL.Id							= CRT.CertificateTypeLookupId	
	   join CertificateStatusHistory					CSH on CSH.CertificateId				= CRT.ID
	   and CSH.ID = (select max(id) from CertificateStatusHistory where  CertificateId = CRT.Id  group by CertificateId)
	   join CertificateStatusLookup						CSL on CSL.Id							= CSH.CertificateStatusLookupId
	   join UserSecurity								USM on USM.UserName						= CRT.LastModifiedByUserName
	   join UserSecurity								USC on USC.UserName						= CRT.CreatedByUserName
	   join AttachedDocument							ATD	on ATD.ParentObjectPrimaryKeyId		= CRT.Id	

```
NAV DOC JOIN

```VBA
/****** VISIT SOP  ******/
SELECT 
POL.Name									as 'Type'
,'SOP'										as 'Entity'
,SOP.Name									as 'Entity Name'
,SOL.Name									as 'SOP Type'
,SOP.SOPNumber							    as 'SOP ID'
,VES.OperationId							as 'OPN'
,SVL.VesselId								as 'VesselId'
--,ATD.Id									as 'NAV ID'
,ATD.Meridio_DocumentId						as 'Meridio ID'
,NULL										as 'App ID'
,NULL										as 'Cert ID'
,VTL.Name									as 'Doc Type'
,DRL.Name									as 'Doc Cat'
,ATD.DocumentName							as 'Doc Name'
,convert(date,ATD.CreatedDateTime,112)		as 'Doc Created'
,NULL 										as 'Expiry Date'
--,CONCAT('http://mnz-16-app01-p.maritime.local/Poseidon/Datacom/DocumentServices/ViewDocument.aspx?docId=','',ATD.Meridio_DocumentId) as Link

 FROM [AttachedDocument]					ATD
 LEFT join ParentObjectTypeLookup			POL on POL.Id			 = ATD.ParentObjectTypeLookupId
 LEFT JOIN Visit							VST on VST.Id			 = ATD.ParentObjectPrimaryKeyId
 LEFT JOIN VisitTypeLookup					VTL on VTL.Id			 = VST.VisitTypeLookupId
 LEFT join DocumentRelationshipTypeLookup   DRL on DRL.Id		     = ATD.DocumentRelationshipTypeLookupId
 LEFT join SOPOPERATION						SOP on SOP.Id			 = VST.ParentObjectPrimaryKeyId	
 LEFT join SOPOperationVesselLink			SVL on SVL.SOPOperationId = SOP.ID
 LEFT join SOPOperationTypeLookup			SOL on SOL.Id			 = SOP.SOPOperationTypeLookupId
 LEFT join Vessel							VES on VES.Id		     = VST.ParentObjectPrimaryKeyId	
 WHERE ATD.ParentObjectTypeLookupId = 8 AND VST.ParentObjectTypeLookupId = 12

 union all

  /****** CERT SOP  ******/
SELECT
POL.Name									as 'Type'
,'SOP'										as 'Entity'
,SOP.Name									as 'Entity Name'
,SOL.Name									as 'SOP Type'
,SOP.SOPNumber							    as 'SOP ID'
,VES.OperationId							as 'OPN'
,SVL.VesselId								as 'VesselId'
--,ATD.Id										as 'NAV ID'
,ATD.Meridio_DocumentId						as 'Meridio ID'
,NULL										as 'App ID'
,CRT.Id										as 'Cert ID'
,CTL.Name									as 'Doc Type'
,DRL.Name									as 'Doc Cat'
,ATD.DocumentName							as 'Doc Name'
,convert(date,ATD.CreatedDateTime,112)		as 'Doc Created'
,convert(date,CRT.ExpiryDueDate,112)		as 'Expiry Date'
							
--,CONCAT('http://mnz-16-app01-p.maritime.local/Poseidon/Datacom/DocumentServices/ViewDocument.aspx?docId=','',ATD.Meridio_DocumentId) as Link

 FROM [AttachedDocument]					ATD
 LEFT join ParentObjectTypeLookup			POL on POL.Id			 = ATD.ParentObjectTypeLookupId
 LEFT JOIN Certificate						CRT on CRT.Id			 = ATD.ParentObjectPrimaryKeyId
 LEFT JOIN Application						APP on APP.Id			 = CRT.ApplicationId
 LEFT join ApplicationTypeLookup			ATL	on ATL.ID			 = APP.ApplicationTypeLookupId
 LEFT join CertificateTypeLookup			CTL on CTL.Id			 = CRT.CertificateTypeLookupId	
 LEFT join DocumentRelationshipTypeLookup   DRL on DRL.Id		     = ATD.DocumentRelationshipTypeLookupId
 LEFT join SOPOPERATION						SOP on SOP.Id			 = APP.ParentObjectPrimaryKeyId
 LEFT join SOPOperationVesselLink			SVL on SVL.SOPOperationId			 = SOP.ID
 LEFT join SOPOperationTypeLookup			SOL on SOL.Id			 = SOP.SOPOperationTypeLookupId
 LEFT join Vessel							VES on VES.Id		     = SVL.VesselId	
 WHERE ATD.ParentObjectTypeLookupId = 4 AND  APP.ParentObjectPrimaryKeyId < '100000'-- CERTIFICATE VES

  union all

 /****** VISIT VESSEL  ******/
 SELECT 
 POL.Name									as 'Type'
 ,'Vessel'									as 'Entity'
,VES.Name									as 'Entity Name'
,null										as 'SOP Type'
,null										as 'SOP ID'
,VES.OperationId							as 'OPN'
,VST.ParentObjectPrimaryKeyId				as 'VesselId'
--,ATD.Id										as 'NAV ID'
,ATD.Meridio_DocumentId						as 'Meridio ID'
,NULL										as 'App ID'
,NULL										as 'Cert Id'
,VTL.Name									as 'Doc Type'	
,DRL.Name									as 'Doc Cat'
,ATD.DocumentName							as 'Doc Name'
,convert(date,ATD.CreatedDateTime,112)		as 'Doc Created'
,NULL 										as 'Expiry Date'

--,CONCAT('http://mnz-16-app01-p.maritime.local/Poseidon/Datacom/DocumentServices/ViewDocument.aspx?docId=','',ATD.Meridio_DocumentId) as Link

 FROM [AttachedDocument]					ATD
 LEFT join ParentObjectTypeLookup			POL on POL.Id			 = ATD.ParentObjectTypeLookupId
 LEFT JOIN Visit							VST on VST.Id			 = ATD.ParentObjectPrimaryKeyId
 LEFT JOIN VisitTypeLookup					VTL on VTL.Id			 = VST.VisitTypeLookupId
 LEFT join DocumentRelationshipTypeLookup   DRL on DRL.Id		     = ATD.DocumentRelationshipTypeLookupId
 LEFT join Vessel							VES on VES.Id		     = VST.ParentObjectPrimaryKeyId	
 WHERE ATD.ParentObjectTypeLookupId = 8 AND VST.ParentObjectTypeLookupId = 1

 union all

 /****** CERT VESSEL  ******/
 SELECT
POL.Name									as 'Type'
,'Vessel'									as 'Entity'
,VES.NAME									as 'Entity Name'
,null										as 'SOP Type'
,null										as 'SOP ID'
,VES.OperationId							as 'OPN'
,app.ParentObjectPrimaryKeyId				as 'VesselId'
--,ATD.Id										as 'NAV ID'
,ATD.Meridio_DocumentId						as 'Meridio ID'
,App.Id										as 'App ID'
,CRT.Id										as 'Cert ID'
,CTL.Name									as 'Doc Type'
,DRL.Name									as 'Doc Cat'
,ATD.DocumentName							as 'Doc Name'
,convert(date,ATD.CreatedDateTime,112)		as 'Doc Created'
,convert(date,CRT.ExpiryDueDate,112)		as 'Expiry Date'

--,CONCAT('http://mnz-16-app01-p.maritime.local/Poseidon/Datacom/DocumentServices/ViewDocument.aspx?docId=','',ATD.Meridio_DocumentId) as Link

 FROM [AttachedDocument]					ATD
 LEFT join ParentObjectTypeLookup			POL on POL.Id			 = ATD.ParentObjectTypeLookupId
 LEFT JOIN Certificate						CRT on CRT.Id			 = ATD.ParentObjectPrimaryKeyId
 LEFT JOIN Application						APP on APP.Id			 = CRT.ApplicationId
 LEFT join ApplicationTypeLookup			ATL	on ATL.ID			 = APP.ApplicationTypeLookupId
 LEFT join CertificateTypeLookup			CTL on CTL.Id			 = CRT.CertificateTypeLookupId	
 LEFT join DocumentRelationshipTypeLookup   DRL on DRL.Id		     = ATD.DocumentRelationshipTypeLookupId
 LEFT join Vessel							VES on VES.Id		     = app.ParentObjectPrimaryKeyId	
 WHERE ATD.ParentObjectTypeLookupId = 4 AND  APP.ParentObjectPrimaryKeyId > '100000'-- CERTIFICATE VES
```
PIVOT FIELDS

```VBA

  SELECT * FROM 
  (
  SELECT DISTINCT CustomerNumber, FullName, CTL.Name
  FROM CustomerRelationshipHistory											CRH
  JOIN CustomerRelationshipTypeLookup									CTL ON CTL.ID = CRH.CustomerRelationshipTypeLookupId
  JOIN ParentObjectTypeLookup											POL ON POL.ID = CRH.ParentObjectTypeLookupId
  WHERE CRM_ContactId IS NOT NULL
  )
  SUB
  PIVOT( COUNT ( NAME) FOR NAME IN (

[Authorised Person Diving]
,[Authorised Person Fishing]
,[Authorised Person Hovercraft]
,[Authorised Person Jet Boat]
,[Authorised Person Rafting]
,[Authorised Person Safety Case]
,[Authorised Person SLP]
,[Authorised Surveyor]
,[Fit Proper Person]
,[Registered Owner]
,[Representative]
,[SOP Owner]
,[SOP Owner Contact]
,[SOP SAR Contact]
,[Trading Operation Contact]
,[Vessel Contact]
,[Vessel Operator]
,[Vessel Owner]
,[Vessel SAR Contact]
,[Visit Contact])
) 
AS PIVOT_TBL
order by FullName
```

LIST ALL RECORDS
```VBA
--- ALL DATA ---

SELECT * from 
(
SELECT 
SUB.TYPE,
SUB.VesselId,
SUB.[Limit Id],
SUB.[Record Id],
SUB.[Operating Limit],
SUB.[Fit to Ply],
SUB.[Max Pass],
SUB.[Modified On],
SUB.[Fin Year],
count(SUB.[Limit Id]) over(partition by SUB.[Limit Id]) AS COUNT,
count(case when sub.[Fit to Ply] like 'Passenger%' then sub.[Limit Id] end ) over(partition by sub.[Limit Id]) as PASS,
ROW_NUMBER() over (Partition by SUB.[Limit Id] ORDER BY SUB.[Record Id] DESC) as OCC
FROM

(
	SELECT DISTINCT
	CASE WHEN AVL.[AuditTypeind] ='D' THEN 'DELETE' ELSE 
	case when AVL.[AuditTypeind] ='I' THEN 'NEW' ELSE 
	case when count(CASE WHEN AuditTypeInd ='D' THEN AuditTypeInd END) over(partition by VesselOperatingLimitLinkId) = 0 then 'AMMEND' else
	case when MAX(AVL.UPDATEID) over(partition by AVL.VesselOperatingLimitLinkID) = AVL.updateid and AVL.[AuditTypeind] ='U' THEN 'REMOVE' ELSE 'AMMEND'
	END END END END									as[TYPE],

	AVL.VesselId,
	VesselOperatingLimitLinkId						as [Limit Id],
	AVL.ID											as [Record Id],
	CONVERT(NVarchaR,AVL.LastModifiedDateTime,103)	as [Modified On],
	olt.name										as [Operating Limit],
	fpt.name										as [Fit to Ply],
	AVL.MaximumNumberOfPassengers					as [Max Pass],

	CASE WHEN (MONTH(AVL.LastModifiedDateTime))  <=6 
	THEN convert(varchar(4), YEAR(AVL.LastModifiedDateTime)-1)  + '/' + convert(varchar(4), YEAR(AVL.LastModifiedDateTime)%100)    
	ELSE convert(varchar(4),YEAR(AVL.LastModifiedDateTime))+ '/' + convert(varchar(4), (YEAR(AVL.LastModifiedDateTime)%100)+1)
	END												as [Fin Year]

	FROM Audit_VesselOperatingLimitLink		AVL
	left join OperatingLimitTypeLookup		olt on OLT.id					= AVL.OperatingLimitTypeLookupId

	left join FitToPlyAsTypeLookup			fpt on FPT.id					= AVL.FitToPlyAsTypeLookupId
	left join UserSecurity					usr on USR.UserName				= AVL.LastModifiedByUserName
	left join VesselVesselCategoryLink		VVL ON VVL.VesselId				= AVL.VesselId
	left join VesselOperatingLimitLink		VOL ON VOL.ID					= AVL.VesselOperatingLimitLinkId
					
)
SUB

)
SUB1
WHERE SUB1.PASS > 0
-- and WHERE Sub.[Limit Id] = '6577' or Sub.[Limit Id] = '7807' or Sub.[Limit Id] = '4084' or Sub.[Limit Id] = '7808'
ORDER BY Sub1.[Limit Id], Sub1.[Record Id] ASC
```

LAST RECORD FILTERED
```VBA

SELECT
SUB3.TYPE,
SUB3.VesselId,
SUB3.[Limit Id],
SUB3.[Record Id],
SUB3.[Operating Limit],
SUB3.[Fit to Ply],
SUB3.[Max Pass],
SUB3.[Modified On],
SUB3.[Fin Year],
MAX(SUB3.[Fin Year]) over(partition by SUB3.[Limit Id]) as 'MAX',
count(SUB3.[Limit Id]) over(partition by SUB3.[Limit Id]) AS COUNT,
count(case when SUB3.[Fit to Ply] like 'Passenger%' then SUB3.[Limit Id] end ) over(partition by SUB3.[Limit Id]) as PASS,
SUB3.OCC
FROM
(
	SELECT *, 
	
	ROW_NUMBER() over (Partition by SUB2.[Limit Id] ORDER BY SUB2.[Record Id] DESC) as [OCC]
	FROM 
	(
		SELECT *,  
	
		CASE WHEN TYPE = 'DELETE' THEN 1 ELSE ROW_NUMBER() over (Partition by SUB1.[Limit Id], SUB1.[Operating Limit], SUB1.[FIT TO PLY], SUB1.[Max Pass] order by SUB1.VESSELID, SUB1.[Limit Id], SUB1.[RECORD ID] ASC) END as RANK
		FROM 
		(
					Select DISTINCT
					CASE WHEN AVL.[AuditTypeind] ='D' THEN 'DELETE' ELSE 
					case when AVL.[AuditTypeind] ='I' THEN 'NEW' ELSE 
					case when count(CASE WHEN AuditTypeInd ='D' THEN AuditTypeInd END) over(partition by VesselOperatingLimitLinkId) = 0 then 'AMMEND' else
					case when MAX(AVL.UPDATEID) over(partition by AVL.VesselOperatingLimitLinkID) = AVL.updateid and AVL.[AuditTypeind] ='U' THEN 'REMOVE' ELSE 'AMMEND'
					END END END END									as[TYPE],

					AVL.VesselId,
					VesselOperatingLimitLinkId						as [Limit Id],
					AVL.ID											as [Record Id],
					CONVERT(NVarchaR,AVL.LastModifiedDateTime,103)	as [Modified On],
					olt.name										as [Operating Limit],
					fpt.name										as [Fit to Ply],
					AVL.MaximumNumberOfPassengers					as [Max Pass],


					CASE WHEN (MONTH(AVL.LastModifiedDateTime))  <=6 
					THEN convert(varchar(4), YEAR(AVL.LastModifiedDateTime)-1)  + '/' + convert(varchar(4), YEAR(AVL.LastModifiedDateTime)%100)    
					ELSE convert(varchar(4),YEAR(AVL.LastModifiedDateTime))+ '/' + convert(varchar(4), (YEAR(AVL.LastModifiedDateTime)%100)+1)
					END												as [Fin Year],

					count(AVL.VesselOperatingLimitLinkId) over(partition by AVL.VesselOperatingLimitLinkId ) AS [COUNTALL],

					count(case when fpt.name like 'Passenger%' then VesselOperatingLimitLinkId end ) over(partition by VesselOperatingLimitLinkId) as PASS

					FROM Audit_VesselOperatingLimitLink		AVL
					left join OperatingLimitTypeLookup		olt on OLT.id					= AVL.OperatingLimitTypeLookupId
					left join FitToPlyAsTypeLookup			fpt on FPT.id					= AVL.FitToPlyAsTypeLookupId
					left join UserSecurity					usr on USR.UserName				= AVL.LastModifiedByUserName
					left join VesselVesselCategoryLink		VVL ON VVL.VesselId				= AVL.VesselId
					left join VesselOperatingLimitLink		VOL ON VOL.ID					= AVL.VesselOperatingLimitLinkId
				    --WHERE VesselOperatingLimitLinkId = '6577' or VesselOperatingLimitLinkId = '7807' or VesselOperatingLimitLinkId = '4084' or VesselOperatingLimitLinkId = '7808' OR VesselOperatingLimitLinkId = '12198'
		)
		SUB1
		where TYPE <> 'Remove' AND SUB1.PASS > 0
	)
	SUB2
	WHERE SUB2.RANK = 1
)
SUB3
ORDER BY SUB3.[LIMIT ID], SUB3.[Record Id]
```

TRITON ALL PEOPLE
```VBA

SELECT 
	   [code]																						AS 'Triton'
	  ,[Person_Details_Person_Details_CRM_Customer_ID]												AS 'CRM'
	  ,[status]																						AS 'Status'
	  ,[birth_date]																					AS 'DOB'
	  ,[given_name]																					AS 'First Name'
	  ,[family_name]																				AS 'Last Name'
	  ,[given_name]+' '+[family_name]																AS 'Full Name'

	   ,isnull(cast([birth_date] as nvarchar),'0000-00-00')   +' '+
	   
	   CASE WHEN (LEN ([given_name]) - LEN (REPLACE ([given_name], ' ', '')) ) = 0
       THEN upper([given_name])
	   ELSE upper(LEFT([given_name],CHARINDEX(' ',([given_name])  )))
       END 

	    +' '+

	   CASE WHEN (LEN ([family_name]) - LEN (REPLACE ([family_name], ' ', '')) ) = 0
       THEN upper([family_name])
	   ELSE upper(REVERSE(LEFT(REVERSE ([family_name]),CHARINDEX(' ',REVERSE ([family_name]))-1)))
	   END

	   as [SHORT NAME REF]		
	   
	   ,CASE WHEN (LEN ([given_name]) - LEN (REPLACE ([given_name], ' ', '')) ) = 0
       THEN upper([given_name])
	   ELSE upper(LEFT([given_name],CHARINDEX(' ',([given_name])  )))
       END 

	    +' '+

	   CASE WHEN (LEN ([family_name]) - LEN (REPLACE ([family_name], ' ', '')) ) = 0
       THEN upper([family_name])
	   ELSE upper(REVERSE(LEFT(REVERSE ([family_name]),CHARINDEX(' ',REVERSE ([family_name]))-1)))
	   END

	   as [SHORT NAME]	
	 
	  ,[created_by]																					AS 'Created By'
	  ,convert(Nvarchar,[created_datetime_local],111)												AS 'Created On'
	  ,convert(nvarchar,[updated_datetime_local],111)												AS 'Modified On'

	  ,cast(year([created_datetime_local]) as nvarchar) +'/'+ cast(format(datepart(WEEK,[created_datetime_local]),'00') as nvarchar) as 'Week Created'

	  ,cast(year([created_datetime_local]) as nvarchar) +'/'+ format(datepart(QUARTER,[created_datetime_local]),'0') as 'Qtr Created'

FROM [TRITON_RDS].[REPORT].[Person_Individual]
where IsCurrent = 'TRUE' AND STATUS = 'Active' 
order by code
```

EX
```VBA
```

https://jackworthen.com/2017/02/01/a-guide-to-creating-a-sql-server-integration-services-catalog-and-deploying-an-ssis-package/#:~:text=The%20first%20step%20to%20creating%20a%20catalog%20is,Catalog%20window%20will%20be%20displayed%20as%20shown%20below.

https://www.w3schools.com/sql/sql_datatypes.asp

https://docs.microsoft.com/en-us/sql/integration-services/lesson-1-create-a-project-and-basic-package-with-ssis?view=sql-server-ver15

https://github.com/microsoft/sql-server-samples/tree/master/samples/databases

#### SSIS BULK IMPORT

https://www.mssqltips.com/sqlservertip/4564/ssis-variable-and-expression-example-part-1/   

https://www.sqlshack.com/import-data-from-multiple-excel-files-in-sql-server-tables-using-an-ssis-package/ 
