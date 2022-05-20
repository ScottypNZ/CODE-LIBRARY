# CODE-LIBRARY

```
CONVERT LIST TO TABLE
= Table.AddColumn( #"Expanded rows", "Records", each Record.FromList([rows],[columnNames] ) )

O-DATA SVC
= OData.Feed("http://mnz-16-app02-p/MaritimeNewZealand/XRMServices/2011/OrganizationData.svc/ContactSet?$select=Home2&$top=3")
= OData.Feed("http://mnz-16-app02-p/MaritimeNewZealand/XRMServices/2011/OrganizationData.svc/ContactSet?&$top=3")

O-DATA API
= OData.Feed("https://crm/maritimenewzealand/api/data/v8.0/contacts")

JSON API
= Json.Document(Web.Contents("https://crm/maritimenewzealand/api/data/v8.0/contacts?$top=10"))


REMOVE LINE BREAKS IN ADDRESS - (SINGLE LINE)
= Table.ReplaceValue(Reordered,"#(cr)#(lf)",", ",Replacer.ReplaceText,{"address1_composite"})

REPLACE VALUES WHERE CONDITION 
= Table.ReplaceValue(#"PREVIOUS STEP","064", 
each if Text.Start([Mobile Phone],3) = "064" then "0064" 
else #"PREVIOUS STEP",Replacer.ReplaceText,{"Mobile Phone"} )

REMOVE NUMBERS NEW COLUMN
= Table.AddColumn(#"Replaced PHONE -", "MOBILE", each Text.Select([Mobile Phone],{"+".."9"}))

COUNT NON BLANK COLUMNS IN RANGE
=List.NonNullCount({[Col1],[Col2],[Col3]})

TEXT REPLACEMENT   
= Text.ReplaceAll([Text], Replacements)

REFERENCE QUERY  
= "BHR"

ADD YEAR AND WEEK  
= Table.AddColumn(#"Added MONTH", "WEEK", each Date.ToText([DATE],"yyyy")&"/"&Text.From(Date.WeekOfYear([DATE])))

EXTRACT YEAR AND MONTH  
= Table.AddColumn(#"Added DATE REF", "MONTH", each Date.ToText([DATE],"yyyy")&"/"&Date.ToText([DATE],"MM"))
= Table.AddColumn(#"Added WEEK", "MONTH", each Date.ToText([DATE],"yyyy") &"/"& Text.PadStart(Text.From(Date.Month([DATE])),2,"0"), type text)

EXTRACT MONTH IN "MMM" FORMAT  
= Date.ToText([Date],"MMM" ) & "_" & Text.From(Date.Year([Date]))

EXTRACT MONTH IN "MM" FORMAT INCLUDING LEADING ZERO  
= Text.PadStart(Text.From(Date.Month([ArrivalDate]),2,"0")))

LEFT 10 CHARACTERS CONVERTED TO TEXT, TRIMMED AND THEN PADDED TO 10  
= Text.PadStart(Text.Trim(Text.Start(Text.From([START]),10)),10,"0"))

PAD START OF DATE AND SUBSTITUE NULL VALUES  
= Table.AddColumn(#"Changed Type", "REFERENCE", 
each if [ArrivalDate] = null then 
Text.PadStart(Text.From([PassengerID]),6,"0")&" "&"00/00/0000"
else 
Text.PadStart(Text.From([PassengerID]),6,"0")&" "&Text.PadStart(Text.From([ArrivalDate]),10,"0"))

REPLACE NULL WITH "XXXXXXX" WHEN SPLITTING FIRST NAME  
= Table.AddColumn(#"Changed Type", "NameRef",
each if [FirstName] = null then "XXXXXX"
else 
Text.Upper(Text.BeforeDelimiter([FirstName]," "))

REPLACE NULL WITH "XXXXXXX" WHEN SPLITTING LAST NAME  
= Table.AddColumn(#"Added NAME REF", "Custom", 
each if [LastName] = null then "XXXXXX"
else 
Text.Upper(Text.AfterDelimiter([LastName]," ")))

SHORT NAME  
= Table.AddColumn(#"Added REFERENCE","TEST", each Text.Proper(List.First(Text.Split([FirstName]," ")) &" "& List.Last(Text.Split([Last.Name]," "))), type text)

REMOVE EXCESS SPACES  
= Table.AddColumn(#"Added RoomH", "ROOMI", each Text.Combine(List.Select(Text.Split([ROOMH]," "),each _ <> "")," "))

TRANSPOSE DATES BETWEEN A RANGE  
= Table.AddColumn(#"Filtered Rows", "DATE", each { Number.From([START])..Number.From([END]) })
 
MERGE QUERIES (AFTER GROUP BY)  
= Table.NestedJoin(#"Reordered Columns",{"REFERENCE"},#"Grouped Rows1",{"REFERENCE"},"Grouped Rows1",JoinKind.LeftOuter)

OPTION1 GROUP BY ID (2 STEPS) "ALL" NEEDS TO BE ADDED   
= Table.Group(Source, {"ID"}, {{"MAX", each List.Max([YEAR]), type number}, {"All", each _, type table }})  
= Table.ExpandTableColumn(#"Grouped Rows", "All", {"YEAR", "ROW3", "ROW4", "ROW5"})
GROUPS BY ID
NEW COLUMN NAME MAX/MAX/YEAR (LAST IS MAX IF VALUE)   
NEW COLUMN NAME ALL/ALLROWS   
EXPAND ALL LESS ID WHICH IS ALREADY IN TABLE.   
UNTICK PREFIX   

OPTION 2 GROUP BY ID (3 STEPS) "ALL" DOES NOT NEED TO BE ADDED   
= Table.Group(Source, {"ID"}, {{"MAX", each List.Max([YEAR]), type number}})   
= Table.NestedJoin(Source, {"ID"}, Table1, {"ID"}, "Grouped Rows", JoinKind.FullOuter)   
= Table.ExpandTableColumn(#"Merged Queries", "Grouped Rows", {"MAX"}, {"MAX"})   
GROUPS BY ID   
NEW COLUMN NAME MAX/MAX/YEAR (LAST IS MAX IF VALUE)  
MERGE QUERIES FULL OUTER ON ID/ID   
EXPAND MAX   

AVERAGE  
= Table.AddColumn(#"Grouped REFERENCE", "AVERAGE", each List.Average(#"Grouped REFERENCE"[COUNT]), type number)

ADD LEAVING ZERO TO NUMBER  
= Table.AddColumn(#"Changed Type", "Average", each Text.PadStart(Text.From([number]),3,"0"))

MAX  
= Table.AddColumn(#"Added MIN", "MAX", each List.Max({Number.From([START]),Number.From([END])}), type date)

MIN  
= Table.AddColumn(#"Added Room End", "MIN", each List.Min({Number.From([START]),Number.From([END])}), type date)

FILTER ROW  
= Table.SelectRows(#"Added Date Range", each [END] <> null)

FILTER ERRORS  
= Table.SelectRowsWithErrors(#"Replaced null rooms", {"HOTEL"})

FILTER OR AND  
= Table.SelectRows(#"Expanded Grouped REFERENCE", each ([ROOMS] = "0909" or [ROOMS] = "0937") and ([BHR] = "BHR-042420"))

CEILING / BUCKET  
= Table.AddColumn(#"Added Custom2", "BUCKET", each Number.RoundUp([COUNT]/20,0)*20, Int64.Type)

CREATE WITH 3DP  
TBC

TEXT CONTAINS  
= Table.AddColumn(#"Changed Type", "TEST", each Text.Contains([#"Flight #"],"1"))

COUNT WORDS   
=List.Count(Text.SplitAny([FULL NAME]," ")))

NET WORD COUNT (LESS BLANKS)  
=List.Count(List.RemoveItems(Text.SplitAny([FULL NAME]," #(tab)#(lf)"),{""})))

SHORT NAME UTILISING NET WORK COUNT (TO STOP SINGLE WORD DUPLICATION)  
=if [NetWordCount] = 1 then [FULL NAME] else Text.Upper(List.First(Text.Split([FULL NAME]," ")))&" "&Text.Upper(List.Last(Text.Split([FULL NAME]," ")))

SPIT DATE   
= Table.SplitColumn(Table.TransformColumnTypes(#"Added SHORT NAME", {{"BirthDate", type text}}, "en-NZ"), "BirthDate", Splitter.SplitTextByEachDelimiter({" "}, QuoteStyle.Csv, false), {"BirthDate.1", "BirthDate.2"})  

CONVERT DATE TO NUMBER (SO DONT NEED TO SPLIT)   
= Table.AddColumn(#"Added DOB", "DOB.1", each Text.PadStart(Text.From(Date.From(Number.From(Date.From([BirthDate])))),10,"0"))  

CONVERT DATE FROM YYYY/MM/DD    
 Date.ToText(Date.From(Text.From([BirthDate])), "dd/MM/yyyy"))    

ADD ROW IF TABLE IS EMPTY   
= if Table.IsEmpty(#"Reordered Columns") = true then Table.InsertRows(#"Reordered Columns", 0,{Record.FromList(List.Repeat({""},Table.ColumnCount(#"Reordered Columns")),Table.ColumnNames(#"Reordered Columns"))}) else #"Reordered Columns"

IMPORT ONLY SELECTED TABLES FROM EXISTING QUERY   
 = Table.SelectColumns(Source,{"MIAS DATE", "PassengerID"}),

_________________________________________________________________

https://opdhsblobprod04-secondary.blob.core.windows.net/contents/9b520b3cc93e43f7ba25a428fd5605f4/b10c45193088c620dcde2762fc236c51?sv=2018-03-28&sr=b&si=ReadPolicy&sig=ujmH19rSqr0MgAy4GPoNrFQymGs4im8K19miED2HgCs%3D&st=2021-07-25T04%3A57%3A19Z&se=2021-07-26T05%3A07%3A19Z

https://www.excelguru.ca/blog/2014/08/20/5-very-useful-text-formulas-power-query-edition/

https://docs.microsoft.com/en-us/powerquery-m/power-query-m-function-reference

https://www.goodly.co.in/extract-first-and-last-name-power-query/

https://www.myonlinetraininghub.com/extract-letters-numbers-symbols-from-strings-in-power-query-with-text-select-and-text-remove
```

### NAME REF   
```VBA
let
    Source = Excel.CurrentWorkbook(){[Name="MIAS"]}[Content],
    #"Removed Other Columns" = Table.SelectColumns(Source,{"FirstName", "OtherNames", "LastName", "BirthDate", "ArrivalDate","PassportNumber"}),
    #"Added FULL NAME" = Table.AddColumn(#"Removed Other Columns", "FULL NAME", each Text.Upper(Text.Combine(List.Select({[FirstName],[OtherNames],[LastName]}, each _<> "" and _ <> null)," "))),
    #"Added FIRST" = Table.AddColumn(#"Added FULL NAME", "FIRST",
    each if [FirstName] = null then "XXXXXX" else Text.Upper(List.First(Text.Split([FirstName]," ")))),
    #"Added LAST" = Table.AddColumn(#"Added FIRST", "LAST", each if [LastName] = null then "XXXXXX" else Text.Upper(List.First(Text.Split([LastName]," ")))),
    #"Added SHORT NAME XXXXXX" = Table.AddColumn(#"Added LAST", "SHORT NAME XXXXXX",  
each if [FirstName] = null then "" else Text.Upper(List.First(Text.Split([FirstName]," ")))&" "&
Text.Upper(List.Last(Text.Split([FULL NAME]," ")))),
    #"Added SHORT NAME" = Table.AddColumn(#"Added SHORT NAME XXXXXX", "SHORT NAME", each [FIRST]&" "&[LAST]),
    #"Added NEW DOB" = Table.AddColumn(#"Added SHORT NAME", "NEW DOB", each Date.ToText(Date.From(Text.From([BirthDate])), "dd/MM/yyyy")),
    #"Added DOB SHORT NAME" = Table.AddColumn(#"Added NEW DOB", "DOB SHORT NAME", each Date.ToText(Date.From(Text.From([BirthDate])), "dd/MM/yyyy")&" "&[SHORT NAME]),
    #"Added ARRIVAL DOB SHORT NAME" = Table.AddColumn(#"Added DOB SHORT NAME", "ARRIVAL DOB SHORT NAME", each Date.ToText(Date.From(Text.From([ArrivalDate])), "dd/MM/yyyy")&" "&[DOB SHORT NAME]),
    #"Added ARRIVAL DOB PASSPORT SHORT NAME" = Table.AddColumn(#"Added ARRIVAL DOB SHORT NAME", "ARRIVAL DOB PASSPORT SHORT NAME", each [NEW DOB]&" "&Text.From([PassportNumber])&" "&[SHORT NAME])
in
    #"Added ARRIVAL DOB PASSPORT SHORT NAME"
```

### APP MAX
```VBA
let
    Source = Excel.CurrentWorkbook(){[Name="APP"]}[Content],
    #"Filtered Rows" = Table.SelectRows(Source, each ([EXCLUDE] = false)),
    #"Removed Other Columns" = Table.SelectColumns(#"Filtered Rows",{"DOB SHORT NAME PASSPORT REF", "DOB PASSPORT REF", "DOB SHORT NAME REF", "MovementId"}),
    #"Grouped Rows" = Table.Group(#"Removed Other Columns", {"DOB SHORT NAME PASSPORT REF", "DOB PASSPORT REF", "DOB SHORT NAME REF"},{{"MAX", each List.Max([MovementId]), type number}})
in
    #"Grouped Rows"
```

### GROUPING MATRIX

```VBA
let
    Source = Excel.CurrentWorkbook(){[Name="BHR"]}[Content],
    #"Removed Other Columns" = Table.SelectColumns(Source,{"MIAS GROUP ID", "ARRIVAL", "Email", "Bubble", "ARRIVAL ROOM REF"}),
    #"Changed Type" = Table.TransformColumnTypes(#"Removed Other Columns",{{"ARRIVAL", type text}, {"ARRIVAL ROOM REF", type text}, {"Email", type text}, {"Bubble", type text}, {"MIAS GROUP ID", type text}}),
    #"Replaced Value" = Table.ReplaceValue(#"Changed Type",null,"XXXX",Replacer.ReplaceValue,{"ARRIVAL ROOM REF", "Email", "Bubble"}),
    #"Added Email REF" = Table.AddColumn(#"Replaced Value", "EMAIL REF", each [ARRIVAL]&" "&[Email]),
    #"Added Bubble REF" = Table.AddColumn(#"Added Email REF", "BUBBLE REF", each [ARRIVAL]&" "&[Bubble]),
    #"Unpivoted Columns" = Table.UnpivotOtherColumns(#"Added Bubble REF", {"MIAS GROUP ID", "ARRIVAL", "Email", "Bubble"}, "Attribute", "Value"),
    #"Filtered Rows" = Table.SelectRows(#"Unpivoted Columns", each ([MIAS GROUP ID] <> "")),
    #"Filtered Rows1" = Table.SelectRows(#"Filtered Rows", each not Text.Contains([Value], "XXXX")),
    #"Removed Columns" = Table.RemoveColumns(#"Filtered Rows1",{"ARRIVAL", "Email", "Bubble", "Attribute"})
in
    #"Removed Columns"
```

_________________________________________________________________

### ROOMING
```VBA
let
    Source = #"MIAS",
    #"Changed Type" = Table.TransformColumnTypes(Source,{{"ROOMING INDEX", Int64.Type}}),
    #"Filtered Rows" = Table.SelectRows(#"Changed Type", each ([ROOMING INDEX] = 1)),
    #"Sorted Rows" = Table.Sort(#"Filtered Rows",{{"Group count", Order.Ascending},{"Group reference", Order.Ascending}}),
    #"Added Index" = Table.AddIndexColumn(#"Sorted Rows", "PAX", 1, 1, Int64.Type),
    #"Removed Columns" = Table.RemoveColumns(#"Added Index",{"ROOMING INDEX", "Booking id", "Room", "ROOMING INDEX BY ROOM"}),
    #"Reordered Columns" = Table.ReorderColumns(#"Removed Columns",{"PAX", "Hotel", "Room type", "Check in", "Check out", "First name", "Last name", "Date of birth", "Group count", "Adjoining room", "Accessibility", "Special requirements", "Dietary requirements", "Group reference", "Flight number", "Unaccompanied minor", "Speak english", "Languages spoken", "Other language", "Email", "Phone", "Primary contact", "Group id", "ROOMING LIST", "ROOMING LIST BY ROOM"}),
    #"Add blank" = if Table.IsEmpty(#"Reordered Columns") = true then Table.InsertRows(#"Reordered Columns", 0,{Record.FromList(List.Repeat({""},Table.ColumnCount(#"Reordered Columns")),Table.ColumnNames(#"Reordered Columns"))}) else #"Reordered Columns"
in
    #"Add blank"
```
### MERGE FILES BASIC

```VBA
let
    Source = Folder.Files("C:\LOCAL DATA\MIAS\MIAS DATA"),
    #"Filtered Hidden Files1" = Table.SelectRows(Source, each [Attributes]?[Hidden]? <> true),
    #"Filtered Rows" = Table.SelectRows(#"Filtered Hidden Files1", each ([Extension] = ".xlsx")),
    #"Invoke Custom Function1" = Table.AddColumn(#"Filtered Rows", "Transform File from MIAS", each #"Transform File from MIAS"([Content])),
    #"Renamed Columns1" = Table.RenameColumns(#"Invoke Custom Function1", {"Name", "Source.Name"}),
    #"Removed Other Columns1" = Table.SelectColumns(#"Renamed Columns1", {"Source.Name", "Transform File from MIAS"}),
    #"Sorted Rows1" = Table.Sort(#"Removed Other Columns1",{{"Source.Name", Order.Ascending}}),
    #"Expanded Table Column1" = Table.ExpandTableColumn(#"Sorted Rows1", "Transform File from MIAS", Table.ColumnNames(#"Transform File from MIAS"(#"Sample File"))),
    #"Changed Type" = Table.TransformColumnTypes(#"Expanded Table Column1",{{"Authorisation checkbox", type text}, {"AuthoriseToValidateInformation", type text}, {"RawFlags", type text}, {"GroupBucket", type text}, {"PassengerBucket", type text}, {"TentativeReleaseDate", type text}, {"Registration declarations", type text}, {"Notes", type text}, {"ArrivalDate", type text}, {"FlightArrivalAirport", type text}, {"FlightArrivalTime", type text}, {"FlightDepartureCity", type text}, {"FlightDepartureTime", type text}, {"Flight", type text}, {"FlightID", type text}, {"AirlineBookingReference", type text}, {"Airline", type text}, {"NumberOfNights", type text}, {"HotelCity", type text}, {"HotelCheckOut", type text}, {"HotelCheckIn", type text}, {"HotelRoomType", type text}, {"HotelRoom", type text}, {"HotelRoomID", type text}, {"Hotel", type text}, {"BookingID", type text}, {"UnaccompaniedMinor", type text}, {"MinorHasParentOrGuardian", type text}, {"VoucherLastSent", type text}, {"VoucherID", type text}, {"DietaryRequirements", type text}, {"HotelRoomSpecialRequests", type text}, {"HotelRoomAccessibilityRequirements", type text}, {"HotelRoomPreferredTypes", type text}, {"HotelRoomAdjoining", type text}, {"PreferredNumberOfRooms", type text}, {"NumberOfPassengersInGroup", type text}, {"GroupName", type text}, {"GroupID", type text}, {"UpdatedAt", type text}, {"CreatedAt", type text}, {"UserID", type text}, {"FinalArrivalDestinationInNewZealand", type text}, {"TemporaryOrPermanentAddress", type text}, {"Contact_Postcode", type text}, {"Contact_City", type text}, {"Contact_Suburb", type text}, {"Contact_StreetName", type text}, {"Contact_ApartmentOrStreetNumber", type text}, {"KnownResidentialAddressInNewZealand", type text}, {"INZClientNumber", type text}, {"Charges-leftBeforeMarch19", type text}, {"Charges-ordinarilyOnMarch19", type text}, {"Charges-DepartAfterAug11", type text}, {"Charges-DurationOfStay", type text}, {"VisaTemporaryOtherTypeSpecified", type text}, {"VisaTemporaryOtherType", type text}, {"VisaDetail", type text}, {"VisaStatus", type text}, {"NewZealandTemporaryVisaHolder", type text}, {"AustralianCitizenOrPermanentResident", type text}, {"NewZealandPermanentResident", type text}, {"NewZealandCitizen", type text}, {"PassportDateOfExpiry", type text}, {"PassportDateOfIssue", type text}, {"PassportIssuingAuthority", type text}, {"PassportNumber", type text}, {"Phone", type text}, {"Email", type text}, {"Nationality", type text}, {"OtherLanguage", type text}, {"LanguagesSpoken", type text}, {"SpeakEnglish", type text}, {"CountryOfDeparture", type text}, {"BirthDate", type text}, {"GenderDiverse", type text}, {"Gender", type text}, {"LastName", type text}, {"OtherNames", type text}, {"FirstName", type text}, {"PrimaryContact", type text}, {"Status", type text}, {"PassengerID", type text}, {"DATE", type text}, {"MIAS DATE", type text}, {"Source.Name", type text}}),
    #"ADD Duplicate" = Table.AddColumn( #"Changed Type", "DUPLICATING", each Text.Combine({[GroupID],[FirstName],[OtherNames],[LastName],[PassportNumber],[INZClientNumber],[FlightID],[Flight],[ArrivalDate],[RawFlags]}," | "), type text),
    #"Reordered Columns" = Table.ReorderColumns(#"ADD Duplicate",{"DUPLICATING", "Source.Name", "MIAS DATE", "DATE", "PassengerID", "Status", "PrimaryContact", "FirstName", "OtherNames", "LastName", "Gender", "GenderDiverse", "BirthDate", "CountryOfDeparture", "SpeakEnglish", "LanguagesSpoken", "OtherLanguage", "Nationality", "Email", "Phone", "PassportNumber", "PassportIssuingAuthority", "PassportDateOfIssue", "PassportDateOfExpiry", "NewZealandCitizen", "NewZealandPermanentResident", "AustralianCitizenOrPermanentResident", "NewZealandTemporaryVisaHolder", "VisaStatus", "VisaDetail", "VisaTemporaryOtherType", "VisaTemporaryOtherTypeSpecified", "Charges-DurationOfStay", "Charges-DepartAfterAug11", "Charges-ordinarilyOnMarch19", "Charges-leftBeforeMarch19", "INZClientNumber", "KnownResidentialAddressInNewZealand", "Contact_ApartmentOrStreetNumber", "Contact_StreetName", "Contact_Suburb", "Contact_City", "Contact_Postcode", "TemporaryOrPermanentAddress", "FinalArrivalDestinationInNewZealand", "UserID", "CreatedAt", "UpdatedAt", "GroupID", "GroupName", "NumberOfPassengersInGroup", "PreferredNumberOfRooms", "HotelRoomAdjoining", "HotelRoomPreferredTypes", "HotelRoomAccessibilityRequirements", "HotelRoomSpecialRequests", "DietaryRequirements", "VoucherID", "VoucherLastSent", "MinorHasParentOrGuardian", "UnaccompaniedMinor", "BookingID", "Hotel", "HotelRoomID", "HotelRoom", "HotelRoomType", "HotelCheckIn", "HotelCheckOut", "HotelCity", "NumberOfNights", "Airline", "AirlineBookingReference", "FlightID", "Flight", "FlightDepartureTime", "FlightDepartureCity", "FlightArrivalTime", "FlightArrivalAirport", "ArrivalDate", "Notes", "Registration declarations", "TentativeReleaseDate",  "PassengerBucket", "GroupBucket", "RawFlags", "AuthoriseToValidateInformation", "Authorisation checkbox"}),
    #"Sorted Rows" = Table.Sort(#"Reordered Columns",{{"PassengerID", Order.Ascending}})
in
    #"Sorted Rows"
  ```
### ADD REFERENCE DETAILS
```VBA
let
    Source = #"MIAS ALL SIMPLE",
    #"Removed Duplicates" = Table.Distinct(Source, {"DUPLICATING"}),
    #"Changed NAME/DATE" = Table.TransformColumnTypes(#"Removed Duplicates",
{{"ArrivalDate", type date},
{"FirstName", type text},
{"OtherNames", type text},
{"LastName", type text},
{"DATE", type date}}),
    #"Added REFERENCE" = Table.AddColumn(#"Changed NAME/DATE", "REFERENCE", each if [ArrivalDate] = null then 
Text.PadStart(Text.From([PassengerID]),6,"0")&" "&"00/00/0000"
else 
Text.PadStart(Text.From([PassengerID]),6,"0")&" "&Text.PadStart(Text.From([ArrivalDate]),10,"0")),
    #"Added MONTH" = Table.AddColumn(#"Added REFERENCE", "MONTH", each if [ArrivalDate] = null then "0000/00" else Text.From(Date.Year([ArrivalDate]))&"/"&Text.PadStart(Text.From(Date.Month([ArrivalDate])),2,"0")),
    #"Added FIRST" = Table.AddColumn(#"Added MONTH", "FIRST",
each if [FirstName] = null then "XXXXXX" else Text.Upper(List.First(Text.Split([FirstName]," ")))),
    #"Added LAST" = Table.AddColumn(#"Added FIRST", "LAST", each if [LastName] = null then "XXXXXX" else Text.Upper(List.First(Text.Split([LastName]," ")))),
    #"Added SHORT NAME" = Table.AddColumn(#"Added LAST", "SHORT NAME", each [FIRST]&" "&[LAST]),
    #"Split DATE" = Table.SplitColumn(Table.TransformColumnTypes(#"Added SHORT NAME", {{"BirthDate", type text}}, "en-NZ"), "BirthDate", Splitter.SplitTextByEachDelimiter({" "}, QuoteStyle.Csv, false), {"BirthDate.1", "BirthDate.2"}),
    #"Added BIRTHDATE" = Table.AddColumn(#"Split DATE", "BirthDate.3", each [BirthDate.1]),
    #"Replaced DASH" = Table.ReplaceValue(#"Added BIRTHDATE","-","/",Replacer.ReplaceText,{"BirthDate.3"}),
    #"Added NUMBER" = Table.AddColumn(#"Replaced DASH", "NUMBER", each Number.From(Date.From([BirthDate.3]))),
    #"Added DOB" = Table.AddColumn(#"Added NUMBER", "DOB", each Text.PadStart(Text.From(Date.From([NUMBER])),10,"0")),
    #"Replaced Errors" = Table.ReplaceErrorValues(#"Added DOB", {{"DOB", "00/00/0000"}}),
    #"Replaced Value" = Table.ReplaceValue(#"Replaced Errors",null,"00/00/0000",Replacer.ReplaceValue,{"DOB"}),
    #"Added NAME-REF" = Table.AddColumn(#"Replaced Value", "NAME-REF", 
each if [DOB] = null 
then "00/00/0000"&" "&[FIRST]&" "&[LAST] 
else [DOB]&" "&[FIRST]&" "&[LAST]),
    #"Added ARRIVAL" = Table.AddColumn(#"Added NAME-REF", "ARRIVAL", each Text.PadStart(Text.From([ArrivalDate]),10,"0")),
    #"Replaced NULL" = Table.ReplaceValue(#"Added ARRIVAL",null,"00/00/0000",Replacer.ReplaceValue,{"ARRIVAL"}),
    #"Removed Other Columns" = Table.SelectColumns(#"Replaced NULL",{"MIAS DATE", "DATE", "PassengerID", "Status", "FirstName", "LastName", "PassportNumber", "UserID", "GroupID", "GroupName", "NumberOfPassengersInGroup", "PreferredNumberOfRooms", "VoucherID", "RawFlags", "REFERENCE", "MONTH", "SHORT NAME", "DOB", "NAME-REF", "ARRIVAL"}),
    #"Sorted Rows1" = Table.Sort(#"Removed Other Columns",{{"MIAS DATE", Order.Descending}})
in
    #"Sorted Rows1"
```


### MERGE EXCEL FILES AND PROCESS
```VBA
let
    Source = Folder.Files("C:\LOCAL DATA\MIAS\DATA"),
    #"Filtered Hidden Files" = Table.SelectRows(Source, each [Attributes]?[Hidden]? <> true),
    #"Invoke Custom Function" = Table.AddColumn(#"Filtered Hidden Files", "Transform File from MIAS", each #"Transform File from MIAS"([Content])),
    #"Sorted File" = Table.Sort(#"Invoke Custom Function",{{"Name", Order.Descending}}),
    #"Expanded Transform MIAS" = Table.ExpandTableColumn(#"Sorted File", "Transform File from MIAS", {"MIAS DATE", "DATE", "PassengerID", "Status", "PrimaryContact", "FirstName", "OtherNames", "LastName", "Gender", "GenderDiverse", "BirthDate", "CountryOfDeparture", "SpeakEnglish", "LanguagesSpoken", "OtherLanguage", "Nationality", "Email", "NZ contact number", "NZ contact number value", "Other contact number", "PassportNumber", "PassportIssuingAuthority", "PassportDateOfIssue", "PassportDateOfExpiry", "NewZealandCitizen", "NewZealandPermanentResident", "AustralianCitizenOrPermanentResident", "NewZealandTemporaryVisaHolder", "VisaStatus", "VisaDetail", "VisaTemporaryOtherType", "VisaTemporaryOtherTypeSpecified", "Charges-DurationOfStay", "Charges-DepartAfterAug11", "Charges-ordinarilyOnMarch19", "Charges-leftBeforeMarch19", "INZClientNumber", "KnownResidentialAddressInNewZealand", "Contact_ApartmentOrStreetNumber", "Contact_StreetName", "Contact_Suburb", "Contact_City", "Contact_Postcode", "TemporaryOrPermanentAddress", "FinalArrivalDestinationInNewZealand", "UserID", "AllowedDuplicateVouchers", "CreatedAt", "UpdatedAt", "GroupID", "GroupName", "NumberOfPassengersInGroup", "PreferredNumberOfRooms", "HotelRoomAdjoining", "HotelRoomPreferredTypes", "HotelRoomAccessibilityRequirements", "HotelRoomSpecialRequests", "DietaryRequirements", "VoucherID", "VoucherLastSent", "MinorHasParentOrGuardian", "UnaccompaniedMinor", "BookingID", "Hotel", "HotelRoomID", "HotelRoom", "HotelRoomType", "HotelCheckIn", "HotelCheckOut", "HotelCity", "NumberOfNights", "Airline", "AirlineBookingReference", "FlightID", "Flight", "FlightDepartureTime", "FlightDepartureCity", "FlightArrivalTime", "FlightArrivalAirport", "ArrivalDate", "Notes", "Registration declarations", "TentativeReleaseDate", "PassengerBucket", "GroupBucket", "RawFlags", "BulkUploadNotes", "Vaccinated", "AuthoriseToValidateInformation", "Authorisation checkbox", "ScanTransportID", "ScanTransportCity", "ScanTransportHotel", "ScanTransportOperator", "ScanTransportTime", "ScanTransportInteractionTime", "ScanTransportInteractionType", "ScanHotel", "ScanHotelInteractionTime", "ScanHotelInteractionType", "ScanHotelOperator", "ScanNumberOfRooms", "ScanRoomNumbers"}, {"MIAS DATE", "DATE", "PassengerID", "Status", "PrimaryContact", "FirstName", "OtherNames", "LastName", "Gender", "GenderDiverse", "BirthDate", "CountryOfDeparture", "SpeakEnglish", "LanguagesSpoken", "OtherLanguage", "Nationality", "Email", "NZ contact number", "NZ contact number value", "Other contact number", "PassportNumber", "PassportIssuingAuthority", "PassportDateOfIssue", "PassportDateOfExpiry", "NewZealandCitizen", "NewZealandPermanentResident", "AustralianCitizenOrPermanentResident", "NewZealandTemporaryVisaHolder", "VisaStatus", "VisaDetail", "VisaTemporaryOtherType", "VisaTemporaryOtherTypeSpecified", "Charges-DurationOfStay", "Charges-DepartAfterAug11", "Charges-ordinarilyOnMarch19", "Charges-leftBeforeMarch19", "INZClientNumber", "KnownResidentialAddressInNewZealand", "Contact_ApartmentOrStreetNumber", "Contact_StreetName", "Contact_Suburb", "Contact_City", "Contact_Postcode", "TemporaryOrPermanentAddress", "FinalArrivalDestinationInNewZealand", "UserID", "AllowedDuplicateVouchers", "CreatedAt", "UpdatedAt", "GroupID", "GroupName", "NumberOfPassengersInGroup", "PreferredNumberOfRooms", "HotelRoomAdjoining", "HotelRoomPreferredTypes", "HotelRoomAccessibilityRequirements", "HotelRoomSpecialRequests", "DietaryRequirements", "VoucherID", "VoucherLastSent", "MinorHasParentOrGuardian", "UnaccompaniedMinor", "BookingID", "Hotel", "HotelRoomID", "HotelRoom", "HotelRoomType", "HotelCheckIn", "HotelCheckOut", "HotelCity", "NumberOfNights", "Airline", "AirlineBookingReference", "FlightID", "Flight", "FlightDepartureTime", "FlightDepartureCity", "FlightArrivalTime", "FlightArrivalAirport", "ArrivalDate", "Notes", "Registration declarations", "TentativeReleaseDate", "PassengerBucket", "GroupBucket", "RawFlags", "BulkUploadNotes", "Vaccinated", "AuthoriseToValidateInformation", "Authorisation checkbox", "ScanTransportID", "ScanTransportCity", "ScanTransportHotel", "ScanTransportOperator", "ScanTransportTime", "ScanTransportInteractionTime", "ScanTransportInteractionType", "ScanHotel", "ScanHotelInteractionTime", "ScanHotelInteractionType", "ScanHotelOperator", "ScanNumberOfRooms", "ScanRoomNumbers"}),
    #"Removed Non core" = Table.SelectColumns(#"Expanded Transform MIAS",{"MIAS DATE", "PassengerID", "PrimaryContact", "FirstName", "OtherNames", "LastName", "BirthDate", "PassportNumber", "INZClientNumber", "UserID", "GroupID", "GroupName", "NumberOfPassengersInGroup", "PreferredNumberOfRooms", "VoucherID", "BookingID", "HotelRoom", "Flight", "ArrivalDate", "RawFlags"}),
    #"Change all to Text" = Table.TransformColumnTypes(#"Removed Non core",{{"MIAS DATE", type text}, {"PassengerID", type text}, {"FirstName", type text}, {"OtherNames", type text}, {"LastName", type text}, {"BirthDate", type text}, {"PassportNumber", type text}, {"INZClientNumber", type text}, {"UserID", type text}, {"GroupID", type text}, {"GroupName", type text}, {"NumberOfPassengersInGroup", type text}, {"PreferredNumberOfRooms", type text}, {"VoucherID", type text}, {"BookingID", type text}, {"HotelRoom", type text}, {"Flight", type text}, {"ArrivalDate", type text}, {"RawFlags", type text}}),
    #"Added COMBINED" = Table.AddColumn(#"Change all to Text", "COMBINED", each Text.Combine({[VoucherID], [PassengerID],[FirstName],[OtherNames],[LastName],[BirthDate],[PassportNumber],[Flight],[ArrivalDate],[RawFlags]}," ")),
    #"Removed Duplicates" = Table.Distinct(#"Added COMBINED", {"COMBINED"}),
    #"Changed Type" = Table.TransformColumnTypes(#"Removed Duplicates",{{"MIAS DATE", type date},{"ArrivalDate", type date}, {"PrimaryContact", Int64.Type}}),
    #"Added MONTH" = Table.AddColumn(#"Changed Type", "MONTH", each if [ArrivalDate] = null then "XXXX/XX" else Text.From(Date.Year([ArrivalDate]))&"/"&Text.PadStart(Text.From(Date.Month([ArrivalDate])),2,"0")),
    #"Merged FULL NAME" = Table.AddColumn(#"Added MONTH", "FULL NAME", each Text.Upper(Text.Combine({[FirstName], [OtherNames], [LastName]}, " ")), type text),
    #"Added AllWordCount" = Table.AddColumn(#"Merged FULL NAME", "AllWordCount", each List.Count(List.RemoveItems(Text.SplitAny([FULL NAME]," #(tab)#(lf)"),{""}))),
    #"Added LastCount" = Table.AddColumn(#"Added AllWordCount", "LastCount", each try List.Count(Text.SplitAny([LastName]," ")) otherwise 0),
    #"Added SHORT NAME" = Table.AddColumn(#"Added LastCount", "SHORT NAME", 
each if [AllWordCount] = 1 and [LastCount] = 1 then "XXXXXXX" &" "&Text.Upper(List.Last(Text.Split([FULL NAME]," "))) 
else if [AllWordCount] = 1 and [LastCount] = 0 then Text.Upper(List.First(Text.Split([FULL NAME]," "))) &" "& "XXXXXXX"
else if [AllWordCount] = 0 then "XXXXXXX" &" "& "XXXXXXX"
else Text.Upper(List.First(Text.Split([FULL NAME]," "))) &" "& Text.Upper(List.Last(Text.Split([FULL NAME]," ")))),
    #"Split DATE" = Table.SplitColumn(Table.TransformColumnTypes(#"Added SHORT NAME", {{"BirthDate", type text}}, "en-NZ"), "BirthDate", Splitter.SplitTextByEachDelimiter({" "}, QuoteStyle.Csv, false), {"BirthDate", "BirthDate.2"}),
    #"Added BIRTHDATE" = Table.AddColumn(#"Split DATE", "BirthDate.3", each [BirthDate]),
    #"Replaced DASH" = Table.ReplaceValue(#"Added BIRTHDATE","-","/",Replacer.ReplaceText,{"BirthDate.3"}),
    #"Added NUMBER" = Table.AddColumn(#"Replaced DASH", "NUMBER", each Number.From(Date.From([BirthDate.3]))),
    #"Added DOB" = Table.AddColumn(#"Added NUMBER", "DOB", each Text.PadStart(Text.From(Date.From([NUMBER])),10,"0")),
    #"Replaced Errors" = Table.ReplaceErrorValues(#"Added DOB", {{"DOB", "XX/XX/XXXX"}}),
    #"Replaced Value" = Table.ReplaceValue(#"Replaced Errors",null,"XX/XX/XXXX",Replacer.ReplaceValue,{"DOB"}),
    #"Added NAME-REF" = Table.AddColumn(#"Replaced Value", "NAME-REF", 
each if [DOB] = null 
then "XX/XX/XXXX"&" "& [SHORT NAME] else [DOB]&" "&[SHORT NAME]),
    #"Added ARRIVAL" = Table.AddColumn(#"Added NAME-REF", "ARRIVAL", each Text.PadStart(Text.From([ArrivalDate]),10,"0")),
    #"Replaced NULL" = Table.ReplaceValue(#"Added ARRIVAL",null,"XX/XX/XXXX",Replacer.ReplaceValue,{"ARRIVAL"}),
    #"Added REFERENCE" = Table.AddColumn(#"Replaced NULL", "REFERENCE", each 
if [ArrivalDate] = null
then Text.PadStart(Text.From([PassengerID]),6,"0") &" "& "XX/XX/XXXX" &" "& [#"NAME-REF"]
else Text.PadStart(Text.From([PassengerID]),6,"0") &" "& Text.PadStart(Text.From([ArrivalDate]),10,"0") &" "& [#"NAME-REF"]),
    #"Added VALID" = Table.AddColumn(#"Added REFERENCE", "INVALID", each [ArrivalDate]=null or [Flight] =null),
    #"Grouped Rows" = Table.Group(#"Added VALID", {"PassengerID"}, {{"MAX", each List.Max([MIAS DATE]), type date}, {"ALL", each _, type table }}),
    #"Expanded ALL" = Table.ExpandTableColumn(#"Grouped Rows", "ALL", {"COMBINED", "PrimaryContact", "MIAS DATE", "FirstName", "OtherNames", "LastName", "BirthDate",  "PassportNumber", "INZClientNumber", "UserID", "GroupID", "GroupName", "NumberOfPassengersInGroup", "PreferredNumberOfRooms", "VoucherID", "BookingID", "HotelRoom", "Flight", "ArrivalDate", "RawFlags", "MONTH", "FULL NAME", "AllWordCount", "LastCount", "SHORT NAME", "BirthDate.2","BirthDate.3", "NUMBER", "DOB", "NAME-REF", "ARRIVAL", "REFERENCE", "INVALID"}),
    #"Added MAX ID" = Table.AddColumn(#"Expanded ALL", "MAX ID", each [MAX]=[MIAS DATE])
in
    #"Added MAX ID"
 ```
 ROOM UTILISATION
 ```VBA
 let
    Source = Excel.CurrentWorkbook(){[Name="BHR_TBL"]}[Content],
    #"Removed other columns" = Table.SelectColumns(Source,{"TYPE", "City", "HOTEL", "ROOM REFERENCE", "PEOPLE", "DAYS", "BHR", "START", "END", "ROOMS"}),
    #"Added START" = Table.AddColumn(#"Removed other columns", "Custom", each Text.PadStart(Text.Trim(Text.Start(Text.From([START]),10)),10,"0"), type date),
    #"Changed Type" = Table.TransformColumnTypes(#"Added START",{{"START", type date}, {"END", type date}}),
    #"Removed Columns" = Table.RemoveColumns(#"Changed Type",{"START"}),
    #"Reordered Columns1" = Table.ReorderColumns(#"Removed Columns",{"City", "HOTEL", "ROOM REFERENCE", "PEOPLE", "DAYS", "BHR", "Custom", "END", "ROOMS"}),
    #"Renamed Columns" = Table.RenameColumns(#"Reordered Columns1",{{"Custom", "START"}}),
    #"Added Custom1" = Table.AddColumn(#"Renamed Columns", "Custom", each Text.PadStart(Text.Trim(Text.Start(Text.From([END]),10)),10,"0"), type date),
    #"Removed Columns1" = Table.RemoveColumns(#"Added Custom1",{"END"}),
    #"Reordered Columns2" = Table.ReorderColumns(#"Removed Columns1",{"City", "HOTEL", "ROOM REFERENCE", "PEOPLE", "DAYS", "BHR", "START", "Custom", "ROOMS"}),
    #"Renamed Columns1" = Table.RenameColumns(#"Reordered Columns2",{{"Custom", "END"}}),
    #"Changed Type all" = Table.TransformColumnTypes(#"Renamed Columns1",{{"HOTEL", type text}, {"ROOM REFERENCE", type text}, {"PEOPLE", Int64.Type}, {"DAYS", Int64.Type}, {"BHR", type text}, {"START", type date}, {"END", type date}, {"ROOMS", type text}, {"City", type text}}),
    #"Replaced null rooms" = Table.ReplaceValue(#"Changed Type all",null,"0000",Replacer.ReplaceValue,{"ROOMS"}),
    #"Removed Errors" = Table.RemoveRowsWithErrors(#"Replaced null rooms", {"City"}),
    #"Added Joined" = Table.AddColumn(#"Removed Errors", "JOINED", each try
if Text.Contains([#"ROOM NUMBER"],"-") then "TRUE" else
if Text.Contains([#"ROOM NUMBER"],"/") then "TRUE" else "FALSE"
otherwise "FALSE"),
    #"Added RoomA" = Table.AddColumn(#"Added Joined", "ROOMA", each Text.Trim(Text.Remove( [ROOMS], { "A".."z","&"..")"} ))),
    #"Reordered Columns" = Table.ReorderColumns(#"Added RoomA",{"JOINED", "ROOM REFERENCE", "PEOPLE", "DAYS", "BHR", "START", "END", "ROOMS"}),
    #"Sorted Rows" = Table.Sort(#"Reordered Columns",{{"ROOM REFERENCE", Order.Descending}}),
    #"Replaced 266267268" = Table.ReplaceValue(#"Sorted Rows","266267268","266 267 268",Replacer.ReplaceText,{"ROOMA"}),
    #"Replaced Phone" = Table.ReplaceValue(#"Replaced 266267268","11080272026065","1108",Replacer.ReplaceText,{"ROOMA"}),
    #"Replaced Phonex" = Table.ReplaceValue(#"Replaced Phone","11080272026065","x11080272026065",Replacer.ReplaceText,{"ROOMS"}),
    #"Replaced Comma" = Table.ReplaceValue(#"Replaced Phonex",","," ",Replacer.ReplaceText,{"ROOMA"}),
    #"Replaced Dash" = Table.ReplaceValue(#"Replaced Comma","-"," ",Replacer.ReplaceText,{"ROOMA"}),
    #"Replaced Slash" = Table.ReplaceValue(#"Replaced Dash","/"," ",Replacer.ReplaceText,{"ROOMA"}),
    #"Replaced BackSlash" = Table.ReplaceValue(#"Replaced Slash","\"," ",Replacer.ReplaceText,{"ROOMA"}),
    #"Replaced +" = Table.ReplaceValue(#"Replaced BackSlash","+"," ",Replacer.ReplaceText,{"ROOMA"}),
    #"Replaced Negative" = Table.ReplaceValue(#"Replaced +","0909   1","0909",Replacer.ReplaceText,{"ROOMA"}),
    #"Replaced Text" = Table.TransformColumns(#"Replaced Negative",{{"ROOMA", Text.Trim, type text}}),
    #"Replaced 08163" = Table.ReplaceValue(#"Replaced Text","08163","816",Replacer.ReplaceText,{"ROOMA"}),
    #"Replaced 18111" = Table.ReplaceValue(#"Replaced 08163","1810 18111","1810 1811",Replacer.ReplaceText,{"ROOMA"}),
    #"Replaced 1101/2" = Table.ReplaceValue(#"Replaced 18111","1101  2","1101  1102",Replacer.ReplaceText,{"ROOMA"}),
    #"Added RoomB" = Table.AddColumn(#"Replaced 1101/2", "ROOMB", 
each if [ROOM REFERENCE] = "12 | 04 | 04"
then Text.Start([#"ROOMA"],3) 
&" "& Text.Start([#"ROOMA"],1) & Text.Middle([#"ROOMA"],4,2)
&" "& Text.Start([#"ROOMA"],1) & Text.Middle([#"ROOMA"],7,2)
&" "& Text.Start([#"ROOMA"],1) & Text.Middle([#"ROOMA"],10,2)
else [#"ROOMA"]),
    #"Added RoomC" = Table.AddColumn(#"Added RoomB", "ROOMC", 
each if [ROOM REFERENCE] = "10 | 03 | 05"
then Text.Start([#"ROOMA"],4) 
&" "& Text.Start([#"ROOMA"],2) & Text.Middle([#"ROOMA"],5,2)
&" "& Text.Start([#"ROOMA"],2) & Text.Middle([#"ROOMA"],8,2)
else [#"ROOMB"]),
    #"Added RoomD" = Table.AddColumn(#"Added RoomC", "ROOMD", 
each if [ROOM REFERENCE] = "09 | 04 | 04"
then Text.Start([#"ROOMA"],3) 
&" "& Text.Start([#"ROOMA"],2) & Text.Middle([#"ROOMA"],4,1)
&" "& Text.Start([#"ROOMA"],2) & Text.Middle([#"ROOMA"],6,1)
&" "& Text.Start([#"ROOMA"],2) & Text.Middle([#"ROOMA"],8,1)
else [#"ROOMC"]),
    #"Added RoomE" = Table.AddColumn(#"Added RoomD", "ROOME", 
each if [ROOM REFERENCE] = "09 | 03 | 04"
then Text.Start([#"ROOMA"],3) 
&" "& Text.Middle([#"ROOMA"],4,3)
&" "& Text.Middle([#"ROOMA"],4,2) & Text.Middle([#"ROOMA"],8,1)
else [#"ROOMD"]),
    #"Added RoomF" = Table.AddColumn(#"Added RoomE", "ROOMF", 
each if [ROOM REFERENCE] = "07 | 02 | 05"
then Text.Start([#"ROOMA"],4) 
&" "& Text.Start([#"ROOMA"],2)&Text.Middle([#"ROOMA"],5,2)
else [#"ROOME"]),
    #"Added RoomG" = Table.AddColumn(#"Added RoomF", "ROOMG", 
each if [ROOM REFERENCE] = "06 | 02 | 05"
then Text.Start([#"ROOMA"],4) 
&" "& Text.Start([#"ROOMA"],3)&Text.Middle([#"ROOMA"],5,1)
else [#"ROOMF"]),
    #"Added RoomH" = Table.AddColumn(#"Added RoomG", "ROOMH", 
each if [ROOM REFERENCE] = "05 | 02 | 04"
then Text.Start([#"ROOMA"],3) 
&" "& Text.Start([#"ROOMA"],2)&Text.Middle([#"ROOMA"],4,1)
else [#"ROOMG"]),
    #"Added Length" = Table.AddColumn(#"Added RoomH", "LENGTH", each Text.Length([ROOMH])),
    #"Added RoomI" = Table.AddColumn(#"Added Length", "ROOMI", 
each if [ROOM REFERENCE] = "06 | 01 | 00" and [LENGTH] = 6
then Text.Start([#"ROOMA"],3) 
&" "& Text.Middle([#"ROOMA"],3,3)
else [#"ROOMH"]),
    #"Removed Rooms" = Table.RemoveColumns(#"Added RoomI",{"ROOMA", "ROOMB", "ROOMC", "ROOMD", "ROOME", "ROOMF", "ROOMG", "ROOMH", "LENGTH"}),
    #"Split Column by Delimiter" = Table.SplitColumn(#"Removed Rooms", "ROOMI", Splitter.SplitTextByDelimiter(" ", QuoteStyle.Csv), {"ROOMI.1", "ROOMI.2", "ROOMI.3", "ROOMI.4", "ROOMI.5", "ROOMI.6", "ROOMI.7", "ROOMI.8"}),
    #"Unpivoted Columns" = Table.UnpivotOtherColumns(#"Split Column by Delimiter", {"TYPE", "City", "JOINED", "HOTEL", "ROOM REFERENCE", "PEOPLE", "DAYS", "BHR", "START", "END", "ROOMS"}, "Attribute", "Value"),
    #"Added Room End" = Table.AddColumn(#"Unpivoted Columns", "ROOM END", each Text.PadStart(Text.From([Value]),4,"0")),
    #"Added MIN" = Table.AddColumn(#"Added Room End", "MIN", each List.Min({Date.From([START]),Date.From([END])}), type date),
    #"Added MAX" = Table.AddColumn(#"Added MIN", "MAX", each List.Max({Date.From([START]),Date.From([END])}), type date),
    #"Removed Old Dates" = Table.RemoveColumns(#"Added MAX",{"START", "END"}),
    #"Renamed New Dates" = Table.RenameColumns(#"Removed Old Dates",{{"MIN", "START"}, {"MAX", "END"}}),

    #"Added Flat dates" = Table.AddColumn(#"Renamed New Dates", "DATE", each { Number.From([START])..Number.From([END])}),
    #"Expanded DATE" = Table.ExpandListColumn(#"Added Flat dates", "DATE"),
    #"Changed Date Type" = Table.TransformColumnTypes(#"Expanded DATE",{{"DATE", type date}}),
    #"Removed Start/End/Value" = Table.RemoveColumns(#"Changed Date Type",{"START", "END", "Value"}),
    #"Added WEEK" = Table.AddColumn(#"Removed Start/End/Value", "WEEK", each Date.ToText([DATE],"yyyy")&"/"&Text.PadStart(Text.From(Date.WeekOfYear([DATE])),2,"0"), type text),
    #"Added MONTH" = Table.AddColumn(#"Added WEEK", "MONTH", each Date.ToText([DATE],"yyyy") &"/"& Text.PadStart(Text.From(Date.Month([DATE])),2,"0"), type text)

/* = Text.PadStart(Text.From(Date.Month([ArrivalDate]),2,"0"))) */,
    #"Added REFERENCE" = Table.AddColumn(#"Added MONTH", "REFERENCE", each 
Text.PadStart(Text.From([DATE]),10,"0")&" | "& Text.From([HOTEL])&" | "& Text.From([ROOM END]), type text),
    #"Added SHORT" = Table.AddColumn(#"Added REFERENCE", "SHORT", each if [DAYS] < 13 then  "TRUE" else"FALSE"),
    #"Added ROOM REF" = Table.AddColumn(#"Added SHORT", "ROOM REF", each Text.From([HOTEL])&" | "& Text.Start([ROOM END],4), type text),
    #"Removed Duplicates" = Table.Distinct(#"Added ROOM REF", {"REFERENCE"}),
    #"Added SUB" = Table.AddColumn(#"Removed Duplicates", "ROW", each "SUB", type text),
    #"Added MIQ" = Table.AddColumn(#"Added SUB", "OFFICE", each "MIQ", type text)
in
    #"Added MIQ"
```
# API   
API CALL - LIST AND JOIN METHOD
 ```VBA
let
    Source = Table.ColumnNames(OData.Feed("https://crm/maritimenewzealand/api/data/v8.0/contacts")),
    #"Converted to Table" = Table.FromList(Source, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    #"Filtered Rows1" = Table.SelectRows(#"Converted to Table", each (
[Column1] = "createdon" or 
[Column1] = "modifiedon" or
[Column1] = "mnz_alert" or
[Column1] = "mnz_customernumber" or
[Column1] = "mnz_tritonpersonid" or
[Column1] = "mnz_tradingas"  or
[Column1] = "birthdate" or
[Column1] = "fullname" or
[Column1] = "firstname" or
[Column1] = "middlename" or
[Column1] = "lastname" or
[Column1] = "emailaddress1" or
[Column1] = "address1_line1" or
[Column1] = "address1_line2" or
[Column1] = "address1_line3" or
[Column1] = "address1_county" or
[Column1] = "address1_city" or
[Column1] = "address1_postalcode" or
[Column1] = "mobilephone" or
[Column1] = "mnz_otherphone" or
[Column1] = "mnz_phones" or
[Column1] = "telephone1" or
[Column1] = "telephone2" or
[Column1] = "mnz_custmnzsolomonid" or
[Column1] = "mnz_custopfsolomonid" or
[Column1] = "mnz_custsarsolomonid" or
[Column1] = "createdby" 
)),
    #"Added Custom" = Table.AddColumn(#"Filtered Rows1", "Custom", each null),
    #"Pivoted Column" = Table.Pivot(#"Added Custom", List.Distinct(#"Added Custom"[Column1]), "Column1", "Custom"),
    #"Reordered Columns" = Table.ReorderColumns(#"Pivoted Column",{"createdon", "modifiedon", "mnz_alert", "mnz_customernumber", "mnz_tritonpersonid", "mnz_tradingas", "birthdate", "fullname", "firstname", "middlename", "lastname", "emailaddress1", "address1_line1", "address1_line2", "address1_line3", "address1_county", "address1_city", "address1_postalcode", "mobilephone", "mnz_otherphone", "mnz_phones", "telephone1", "telephone2", "mnz_custmnzsolomonid", "mnz_custopfsolomonid", "mnz_custsarsolomonid", "createdby"}),
    Join = Table.NestedJoin(#"Reordered Columns", {"mnz_customernumber"}, OData.Feed("https://crm/maritimenewzealand/api/data/v8.0/contacts"), {"mnz_customernumber"}, "test", JoinKind.FullOuter)
in
    Join
```

