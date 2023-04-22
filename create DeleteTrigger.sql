use Company_Lab99
go

create or alter trigger Trig_DeleteAudit_EmpSalary on Employee
for Delete
As
BEGIN

Declare @old_ssn char(9);
Declare @new_ssn char(9);
Declare @old_Salary char(20);
Declare @new_Salary char(20);
Declare @old_Dno int;
Declare @new_Dno int;

Declare @Fname varchar(25);
Declare @Minit char(10);
Declare @Lname varchar(25);
Declare @SSN char(9);
Declare @BDate date;
Declare @Address varchar(50);
Declare @Sex char(1);
Declare @Salary decimal(18,2);
Declare @SuperSSN char(9);
Declare @DNO int;

		set @old_ssn = (select SSN from Deleted d);

		set @old_salary = (select salary from deleted d);

		set @old_dno = (select DNO from deleted d); 

exec dbo.SP_Audit_EmpSalary 
			@DML_Type = 'Delete', 
			@old_ssn = @old_ssn, 
			@new_SSN = null, 
			@old_salary = @old_salary, 
			@new_salary = null, 
			@old_dno = @old_dno, 
			@new_dno = null;



End



