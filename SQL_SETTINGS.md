#### SSMS PROJECT EXECUTION

1) CHECK CLR IS ACTIVE

'''vba
select * from sys.configurations where name = 'clr enabled' 
'''

2) ACTIVATE CLR

''' vba
sp_configure 'show advanced options',1
GO
RECONFIGURE
GO
sp_configure 'clr enabled',1
GO
RECONFIGURE
GO
'''
