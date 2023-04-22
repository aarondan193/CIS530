IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'lab2')
CREATE DATABASE lab2;
go

use testTable;
go

create table testTable(
 a VARCHAR(50), 
 b VARCHAR(50),
 c VARCHAR(500),
 d VARCHAR(50),
);


BULK INSERT testTable
FROM 'C:\Users\14407\OneDrive\Desktop\CIS593\lab2\test.csv'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  ROWS_PER_BATCH = 10000, 
  FIRSTROW = 2,
  TABLOCK
)
select * from lab2

use lab2
go

BULK INSERT lab2
FROM 'C:\\Users\\14407\\OneDrive\\Desktop\\CIS593\\lab2\\test.csv'
WITH
(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  ROWS_PER_BATCH = 10000, 
  FIRSTROW = 1,
  TABLOCK
)

create table business(business_id VARCHAR(50), full_address VARCHAR(50), [open] BIT, city VARCHAR(50), review_count int, [name] VARCHAR(50), neighborhoods VARCHAR(100), longitude DEC(5,2), state VARCHAR(2), stars FLOAT, latitude DEC(5,2), [type] VARCHAR(50));