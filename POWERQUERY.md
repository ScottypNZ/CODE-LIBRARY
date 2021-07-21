# CODE-LIBRARY

= Table.AddColumn(#"Added Custom", "WEEK", each Text.From(Date.Year([Date]))& "_" & Text.From(Date.week([Date])))

= Date.ToText([Date],"MMM" ) & "_" & Text.From(Date.Year([Date]))
