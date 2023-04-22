use Company_Lab99
go

create or alter trigger Trig_UpdateAudit_EmpSalary on Employee
for Update
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
		set @old_ssn = (select SSN from Deleted d where d.ssn = @SSN);
		set @new_ssn = (select SSN from Inserted I where I.ssn = @SSN);
		set @old_salary = (select salary from deleted d where d.ssn = @SSN);
		set @new_salary = (select salary from Inserted I where I.ssn = @SSN);
		set @old_dno = (select DNO from deleted d where d.ssn = @SSN); 
		set @new_dno = (select DNO from Inserted I where I.ssn = @SSN);
		if @old_Salary <> @new_Salary
		begin
			exec dbo.SP_Audit_EmpSalary 
			@DML_Type = 'Update', 
			@old_ssn = @old_ssn, 
			@new_SSN = @new_ssn, 
			@old_salary = @old_salary, 
			@new_salary = @new_Salary, 
			@old_dno = @old_dno, 
			@new_dno = @new_DNO;
		end
		FETCH NEXT FROM @AuditCursor INTO @Fname, @Minit, @Lname, @SSN, @BDate, @Address, @Sex, @Salary, @SuperSSN, @DNO;	
	END;
	
	CLOSE @AuditCursor;
	DEALLOCATE @AuditCursor;

End



