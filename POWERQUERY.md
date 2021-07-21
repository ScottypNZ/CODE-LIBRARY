# CODE-LIBRARY

ADD YEAR AND WEEK
= Table.AddColumn(#"Added Custom", "WEEK", each Text.From(Date.Year([Date]))& "_" & Text.From(Date.week([Date])))

EXTRACT MONTH IN "MMM" FORMAT
= Date.ToText([Date],"MMM" ) & "_" & Text.From(Date.Year([Date]))

EXTRACT MONTH IN "MM" FORMAT
= Text.PadStart(Text.From(Date.Month([ArrivalDate]),2,"0")))
