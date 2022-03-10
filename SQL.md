### CODE-LIBRARY

### BASICS
 
```SQL 

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

https://jackworthen.com/2017/02/01/a-guide-to-creating-a-sql-server-integration-services-catalog-and-deploying-an-ssis-package/#:~:text=The%20first%20step%20to%20creating%20a%20catalog%20is,Catalog%20window%20will%20be%20displayed%20as%20shown%20below.

https://www.w3schools.com/sql/sql_datatypes.asp

https://docs.microsoft.com/en-us/sql/integration-services/lesson-1-create-a-project-and-basic-package-with-ssis?view=sql-server-ver15

https://github.com/microsoft/sql-server-samples/tree/master/samples/databases

#### SSIS BULK IMPORT

https://www.mssqltips.com/sqlservertip/4564/ssis-variable-and-expression-example-part-1/   

https://www.sqlshack.com/import-data-from-multiple-excel-files-in-sql-server-tables-using-an-ssis-package/ 
