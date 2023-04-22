use Company_Lab99
go

create or alter trigger Trig_InsertAudit_EmpSalary on Employee
for Insert
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


DECLARE @AuditCursor as CURSOR;
	SET @AuditCursor = CURSOR FOR
	SELECT *
	 from Employee;

	OPEN @AuditCursor;

	FETCH NEXT FROM @AuditCursor INTO @Fname, @Minit, @Lname, @SSN, @BDate, @Address, @Sex, @Salary, @SuperSSN, @DNO;

	WHILE @@FETCH_STATUS = 0
		BEGIN
		set @old_ssn = null;
		set @new_ssn = (select SSN from Inserted I where I.ssn = @SSN);
		set @old_salary = null;
		set @new_salary = (select salary from Inserted I where I.ssn = @SSN);
		set @old_dno = null; 
		set @new_dno = (select DNO from Inserted I where I.ssn = @SSN);

		if (@new_SSN IS NOT null)
		begin
			exec dbo.SP_Audit_EmpSalary 
			@DML_Type = 'Insert', 
			@old_ssn = null, 
			@new_SSN = @new_ssn, 
			@old_salary = NULL, 
			@new_salary = @new_Salary, 
			@old_dno = null, 
			@new_dno = @new_DNO;
		end
		FETCH NEXT FROM @AuditCursor INTO @Fname, @Minit, @Lname, @SSN, @BDate, @Address, @Sex, @Salary, @SuperSSN, @DNO;	
	END;
	
	CLOSE @AuditCursor;
	DEALLOCATE @AuditCursor;

End



