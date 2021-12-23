### CODE-LIBRARY
 
SELECT DISTINCT [MIAS DATE] FROM DATA;  

SELECT COUNT(DISTINCT [MIAS DATE]) FROM DATA;  

SELECT DISTINCT [MIAS DATE] FROM DATA  ORDER BY [MIAS DATE] DESC;

SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'DATA' ;

ALTER TABLE [DATA] ALTER COLUMN [Contact_ApartmentOrStreetNumber] NVARCHAR(255);  



SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'DATA' and column_name like '%DATE%';

https://jackworthen.com/2017/02/01/a-guide-to-creating-a-sql-server-integration-services-catalog-and-deploying-an-ssis-package/#:~:text=The%20first%20step%20to%20creating%20a%20catalog%20is,Catalog%20window%20will%20be%20displayed%20as%20shown%20below.

DATA TYPES https://www.w3schools.com/sql/sql_datatypes.asp
