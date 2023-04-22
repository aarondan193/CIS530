use COMPANY;

insert into company.dbo.dependent values('453453453','JOE', 'M', '31-Dec-2020', 'SPOUSE'),
('987654321','ERICA WALLACE', 'F', '1-Jan-2021', 'DAUGHTER');
insert into company.dbo.WORKS_ON values('987654321',10,0);


select * from Dependent;

select * from WORKS_ON;

--Q1
select d.dnumber, d.dname, e.fname, e.lname, s.fname as superfname, s.lname as superlname
from (DEPARTMENT d left outer join Employee e on D.DNUMBER = E.DNO) left outer join Employee S on E.SUPERSSN = S.SSN

--Q1_1
select d.dnumber, d.dname, e.fname, e.lname, s.fname as superfname, s.lname as superlname
from (DEPARTMENT d inner join Employee e on D.DNUMBER = E.DNO) left outer join Employee S on E.SUPERSSN = S.SSN

--Q2

select e.ssn, e.LNAME
from Employee e
where	e.sex = 'F' and
		e.ssn in (select d.essn
				from DEPENDENT d
				where d.essn = e.SSN and d.RELATIONSHIP = 'spouse') and
		e.ssn in (select w.essn
				from WORKS_ON w
				group by w.ESSN
				having count(*) >= 3);

--Q3
select e.fname, e.lname
from Employee e
where	e.dno = '5' and
		e.ssn in (select d.essn
				from Dependent d
				where d.essn = e.ssn and d.Relationship = 'spouse'
				except
				select d.essn
				from DEPENDENT d
				where d.essn = e.ssn and d.RELATIONSHIP = 'son' or d.RELATIONSHIP = 'daughter'
				)
				
--Q4

select e.lname
from EMPLOYEE e
where e.ssn in (select d.essn
				from Dependent d
				where d.essn = e.ssn and d.RELATIONSHIP = 'daughter') and
	 e.ssn in (select d.essn
				from Dependent d
				where d.essn = e.ssn and d.RELATIONSHIP = 'spouse') and
	 e.ssn not in (select d.essn
					from DEPENDENT d
					where d.essn = e.ssn and d.RELATIONSHIP = 'son')		


--Q5
select e.ssn, e.LNAME
from EMPLOYEE e join WORKS_ON w on e.ssn = w.ESSN
where (select count(*)
from EMPLOYEE e1, WORKS_ON w1
where w1.ESSN = e1.SSN and e1.SEX = 'F' and w1.pno = w.PNO) >
(select count(*)
from EMPLOYEE e2, WORKS_ON w2
where w2.essn = e2.SSN and e2.sex = 'M' and w2.pno = w.pno);


