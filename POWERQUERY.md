# CODE-LIBRARY

https://opdhsblobprod04-secondary.blob.core.windows.net/contents/9b520b3cc93e43f7ba25a428fd5605f4/b10c45193088c620dcde2762fc236c51?sv=2018-03-28&sr=b&si=ReadPolicy&sig=ujmH19rSqr0MgAy4GPoNrFQymGs4im8K19miED2HgCs%3D&st=2021-07-25T04%3A57%3A19Z&se=2021-07-26T05%3A07%3A19Z

https://www.excelguru.ca/blog/2014/08/20/5-very-useful-text-formulas-power-query-edition/

https://docs.microsoft.com/en-us/powerquery-m/power-query-m-function-reference

https://www.goodly.co.in/extract-first-and-last-name-power-query/

https://www.myonlinetraininghub.com/extract-letters-numbers-symbols-from-strings-in-power-query-with-text-select-and-text-remove

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

ROOMING
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





