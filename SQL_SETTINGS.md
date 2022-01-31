#### SSMS PROJECT EXECUTION

1) CHECK CLR IS ACTIVE

```sql
select * from sys.configurations where name = 'clr enabled' 
```

2) ACTIVATE CLR

```sql
sp_configure 'show advanced options',1
GO
RECONFIGURE
GO
sp_configure 'clr enabled',1
GO
RECONFIGURE
GO
```
 
3) CHANGE DEFAULT DATABASE

```SQL
ALTER LOGIN [WD\phillis4] WITH DEFAULT_DATABASE = [LOCAL DATABASE]
```
