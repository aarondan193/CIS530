--CIS_530 - Lab Assignment 2_2
--Name: Aaron Daniels
--ID: 2430989
--Object: Creating a Relational Database using SQL and SQL server/Oracle Database 11g

IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'COMPANY')
CREATE DATABASE COMPANY;
go

use COMPANY;
go

IF OBJECT_ID('dbo.EMPLOYEE') IS NULL
create table EMPLOYEE(
 FNAME VARCHAR(25) NOT NULL, 
 MINIT CHAR, 
 LNAME VARCHAR(25) NOT NULL, 
 SSN CHAR(9) NOT NULL,
 BDATE DATE, 
 [ADDRESS] VARCHAR(50) NOT NULL, 
 SEX CHAR NOT NULL, 
 SALARY DECIMAL(18,2), 
 SUPERSSN CHAR(9),
 DNO int,
);

IF OBJECT_ID('dbo.DEPARTMENT') IS NULL
CREATE TABLE DEPARTMENT(
 DNAME VARCHAR(25) NOT NULL, 
 DNUMBER int NOT NULL,
 MGR_SSN CHAR(9),
 MGR_START_DATE DATE,
);

IF OBJECT_ID('dbo.DEPT_LOCATIONS') IS NULL
CREATE TABLE DEPT_LOCATIONS(
  DNUMBER int NOT NULL,
  DLOCATION VARCHAR(25) NOT NULL,
)

IF OBJECT_ID('dbo.PROJECT') IS NULL
CREATE TABLE PROJECT(
  PNAME VARCHAR(25),
  PNUMBER int NOT NULL,
  PLOCATION VARCHAR(25),
  DNUM int,
)

IF OBJECT_ID('dbo.WORKS_ON') IS NULL
CREATE TABLE WORKS_ON(
  ESSN CHAR(9) NOT NULL,
  PNO int NOT NULL,
  HOURS Decimal,
)

IF OBJECT_ID('dbo.DEPENDENT') IS NULL
CREATE TABLE DEPENDENT(
 ESSN CHAR(9) NOT NULL,
 DEPENDENT_NAME VARCHAR(25) NOT NULL,
 SEX CHAR,
 BIRTHDATE DATE,
 RELATIONSHIP VARCHAR(25),
)

--adding primary keys
ALTER TABLE EMPLOYEE
ADD PRIMARY KEY (SSN);
ALTER TABLE DEPARTMENT
ADD PRIMARY KEY (DNUMBER);
ALTER TABLE DEPT_LOCATIONS
ADD PRIMARY KEY (DNUMBER, DLOCATION);
ALTER TABLE PROJECT
ADD PRIMARY KEY (PNUMBER);
ALTER TABLE WORKS_ON
ADD PRIMARY KEY (ESSN, PNO);
ALTER TABLE DEPENDENT
ADD PRIMARY KEY (ESSN, dependent_NAME);


--bad data from step 1
--INSERT INTO EMPLOYEE VALUES ('James', 'E', 'Borg', '888665555', '10-Nov-27', '450 Stone, Houston, TX', 'M', 55000, NULL, 1);
--INSERT INTO EMPLOYEE VALUES ('James', 'E', 'Borg', '888665555', '10-Nov-27', '450 Stone, Houston, TX', 'M', 55000, NULL, 1);
--INSERT INTO EMPLOYEE VALUES ('James', 'E', 'Borg', NULL, '10-Nov-27', '450 Stone, Houston, TX', 'M', 55000, NULL, 1);
--INSERT INTO EMPLOYEE VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO COMPANY.dbo.EMPLOYEE values ('John', 'B', 'Smith', '123456789', '1955-01-09', '731 Fondren, Houston, TX', 'M', 30000, '987654321', 5), 
('Franklin', 'T', 'Wong', '333445555', '1945-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5), 
('Joyce', 'A', 'English', '453453453', '1962-12-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5),
('Ramesh','K','Narayan','666884444','15-Sep-52','975 Fire Oak,Humble,TX','M',38000,'333445555',5),
('James','E','Borg','888665555','10-Nov-27','450 Stone, Houston, TX','M','55000',NULL,1),
('Jennifer','S','Wallace','987654321','20-Jun-31','291 Berry, Bellaire,	TX','F',43000,'888665555',4),
('Ahmad','V','Jabbar','987987987','29-Mar-59','980 Dallas, Houston, TX','M',25000,'987654321',4),
('Alicia','J','Zelaya','999887777','19-Jul-58','3321,Castle, SPring, TX','F',25000,'987654321',4);

INSERT INTO COMPANY.dbo.DEPARTMENT values('Headquarters',1,'888665555','19-Jun-71'),
('Administration',4,'987654321','01-Jan-85'),
('Research',5,'333445555','22-May-78'),
('Automation',7,'123456789','06-Oct-05');

INSERT INTO COMPANY.dbo.DEPENDENT values('123456789','Alice','F','31-Dec-78','Daughter'),
('123456789','Elizabeth','F','05-May-57','Spouse'),
('123456789','Michael','M','01-Jan-78','Son'),
('333445555','Alice','F','05-Apr-76','Daughter'),
('333445555','Joy','F','03-May-48','Spouse'),
('333445555','Theodore','M','25-Oct-73','Son'),
('987654321','Abner','M','29-Feb-32','Spouse');

INSERT INTO COMPANY.dbo.DEPT_LOCATIONS values(1,'Houston'),
(4,'Stafford'),
(5,'Bellaire'),
(5,'Sugarland'),
(5,'Houston');

INSERT INTO COMPANY.dbo.PROJECT values('ProductX',1,'Bellaire',5),
('ProductY',2,'Sugarland',5),
('ProductZ',3,'Houston',5),
('Computerization',10,'Stafford',4),
('Reorganization',20,'Houston',1),
('Newbenefits',30,'Stafford',4);

INSERT INTO COMPANY.dbo.WORKS_ON values('123456789',1,32.5),
('123456789',2,7.5),
('333445555',2,10),
('333445555',3,10),
('333445555',10,10),
('333445555',20,10),
('453453453',1,20),
('453453453',2,20),
('666884444',3,40),
('888665555',20,NULL),
('987654321',20,15),
('987654321',30,20),
('987987987',10,35),
('987987987',30,5),
('999887777',10,10),
('999887777',30,30);



--adding foreign keys
ALTER TABLE employee ADD
foreign key (superssn) references employee(ssn),
foreign key (dno) references department(dnumber);

ALTER TABLE DEPT_LOCATIONS ADD
foreign key (DNUMBER) references DEPARTMENT(dnumber);

ALTER TABLE Project ADD
foreign key (dnum) references DEPARTMENT(dnumber);

ALTER TABLE WORKS_ON ADD
foreign key (ESSN) references EMPLOYEE(SSN),
foreign key (PNO) references PROJECT(PNUMBER);

ALTER TABLE dependent ADD
foreign key (ESSN) references EMPLOYEE(SSN);

Select * From WORKS_ON;