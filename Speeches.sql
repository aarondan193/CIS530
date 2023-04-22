IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'Speeches')
CREATE DATABASE Speeches;
go

use Speeches;
go

IF OBJECT_ID('dbo.Speeches') IS NULL
create table Speeches(
 NAME VARCHAR(50), 
 [DATE] VARCHAR(50),
 LINK VARCHAR(500),
 [TEXT] TEXT
);


SELECT * from Speeches;
Select * from Speeches where NAME = 'George Washington';
