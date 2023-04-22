use COMPANY;
go

create view VDEPT_BUDGET
as select d.DNAME, d.DNUMBER, count(e.DNO) as number_of_employees
from DEPARTMENT d left join Employee e on e.dno = d.DNUMBER
group by d.DNAME, d.DNUMBER
go

select * from VDEPT_BUDGET;

insert into Employee values('Aaron', 'M', 'Daniels', 112233445, '22-Jan-1993', '885 Sunrise Circle', 'm', '1000000', NULL, '4');

select * from VDEPT_BUDGET;

Alter view VDEPT_BUDGET
as select d.DNAME, d.DNUMBER, count(e.DNO) as number_of_employees, sum(e.salary) as Sum_Salary, CAST(AVG(e.SALARY) AS Decimal(10, 2)) as Ave_Salary
from DEPARTMENT d left join Employee e on e.dno = d.DNUMBER
group by d.DNAME, d.DNUMBER

select * from VDEPT_BUDGET;

