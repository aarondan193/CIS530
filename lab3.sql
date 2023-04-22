use COMPANY;

--INSERT INTO COMPANY.dbo.EMPLOYEE values ('Aaron', 'M', 'Daniels', '123456777', '1983-01-22', '885 Sunrise Circle, Aurora, OH', 'M', 30000, '987654321', 5)
Select * 
From EMPLOYEE
where LNAME = 'DANIELS';

--Q1
select e.FNAME, e.MINIT, e.LNAME, e.ADDRESS
from Employee e, Department d
where e.ssn = d.MGR_SSN and e.SEX = 'F';

--Q2
select PNO
from Employee e, WORKS_ON w
where e.Lname = 'SMITH' and e.ssn = w.ESSN
UNION
select PNUMBER
from Employee e, Department d, Project p
where e.LNAME = 'SMITH' and e.SSN = d.MGR_SSN and p.DNUM = d.DNUMBER;

--Q3
select e.FNAME, e.MINIT, e.LNAME, e.ADDRESS, d.DNAME
from EMPLOYEE e, DEPARTMENT d
where e.SUPERSSN IS NULL and e.DNO = d.DNUMBER

--Q4
select d.DNUMBER, d.DNAME, e.FNAME, e.LNAME, e2.FNAME as Supervisors_First_Name, e2.LNAME as Supervisors_Last_Name
from Employee e, Employee e2, DEPARTMENT d
where e.DNO = d.DNUMBER and e.SUPERSSN = e2.SSN
UNION
select d.DNUMBER, d.DNAME, e.FNAME, e.LNAME, NULL, NULL
from Employee e, Department d
where e.DNO = d.DNUMBER and e.superssn IS NULL
order by DNUMBER, DNAME

--Q5
select FNAME, LNAME
from Employee e, Department d
where d.MGR_SSN = e.SSN
Except
select FNAME, LNAME
from EMPLOYEE e, Dependant d
where e.SSN = d.ESSN