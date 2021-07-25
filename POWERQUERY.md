# CODE-LIBRARY

https://docs.microsoft.com/en-us/powerquery-m/power-query-m-function-reference

https://opdhsblobprod04-secondary.blob.core.windows.net/contents/9b520b3cc93e43f7ba25a428fd5605f4/b10c45193088c620dcde2762fc236c51?sv=2018-03-28&sr=b&si=ReadPolicy&sig=ujmH19rSqr0MgAy4GPoNrFQymGs4im8K19miED2HgCs%3D&st=2021-07-25T04%3A57%3A19Z&se=2021-07-26T05%3A07%3A19Z



ADD YEAR AND WEEK
= Table.AddColumn(#"Added Custom", "WEEK", each Text.From(Date.Year([Date]))& "_" & Text.From(Date.week([Date])))

EXTRACT MONTH IN "MMM" FORMAT
= Date.ToText([Date],"MMM" ) & "_" & Text.From(Date.Year([Date]))

EXTRACT MONTH IN "MM" FORMAT
= Text.PadStart(Text.From(Date.Month([ArrivalDate]),2,"0")))

https://www.excelguru.ca/blog/2014/08/20/5-very-useful-text-formulas-power-query-edition/

https://www.goodly.co.in/extract-first-and-last-name-power-query/

= Table.AddColumn(#"Changed Type", "REFERENCE", 
each if [ArrivalDate] = null then 
Text.PadStart(Text.From([PassengerID]),6,"0")&" "&"00/00/0000"
else 
Text.PadStart(Text.From([PassengerID]),6,"0")&" "&Text.PadStart(Text.From([ArrivalDate]),10,"0"))



= Table.AddColumn(#"Added REFERENCE", "MONTH", each Text.From(Date.Year([DATE]))&"/"&Text.PadStart(Text.From(Date.Month([DATE])),2,"0"))


= Table.AddColumn(#"Changed Type", "NameRef",
each if [FirstName] = null then "XXXXXX"
else 
Text.Upper(Text.BeforeDelimiter([FirstName]," "))


= Table.AddColumn(#"Added NAME REF", "Custom", 
each if [LastName] = null then "XXXXXX"
else 
Text.Upper(Text.AfterDelimiter([LastName]," ")))


= Table.AddColumn(#"Added REFERENCE","TEST", each Text.Proper(List.First(Text.Split([FirstName]," ")) &" "& List.Last(Text.Split([Last.Name]," "))), type text)





