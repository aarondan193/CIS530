create database friends
go

create table users(
name varchar(50) not null,
[address] varchar(50) not null,
phone varchar (10) not null,
email varchar (50) not null
PRIMARY KEY (email)
)
go

create table friends(
name varchar(50) not null,
[address] varchar(50) not null,
phone varchar (10) not null,
email varchar (50) not null
PRIMARY KEY (email)
)
go
	