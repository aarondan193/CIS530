create database friendbook
go
USE friendbook
go

CREATE TABLE userAccount( 
 NAME VARCHAR(25) NOT NULL,
 [ADDRESS] VARCHAR(50),
 email varchar(50) NOT NULL, 
 phone varchar(25) NOT NULL
 primary key(email)
);

CREATE TABLE friend( 
 email VARCHAR(50) NOT NULL,
 friendEmail VARCHAR(50) NOT NULL,
  primary key(email, friendEmail)
);