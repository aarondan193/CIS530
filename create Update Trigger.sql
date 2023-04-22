use COMPANY_Lab99;
go

create procedure SP_Audit_EmpSalary @DML_Type varchar(10), @old_SSN char(9), @new_SSN char(9), @old_Salary char(20), @new_Salary char(20), @old_Dno INT, @new_Dno INT
as
begin

	insert into dbo.Audit_EmpSalary values (getDate(),@DML_Type,@old_SSN,@new_SSN, @old_Salary, @new_Salary,@old_Dno,@new_Dno);
end


