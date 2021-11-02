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

COUNT WORDS REMOVING BLANKS  
=List.Count(List.RemoveItems(Text.SplitAny([FULL NAME]," #(tab)#(lf)"),{""})))



