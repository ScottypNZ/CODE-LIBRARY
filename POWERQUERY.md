# CODE-LIBRARY


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
    
_________________________________________________________________

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
