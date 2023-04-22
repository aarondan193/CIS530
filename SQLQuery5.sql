use COMPANY;
go

create procedure sp_Report_new_budget
as
IF (Select COUNT(*) from VDept_Budget) > 0 --checks if empty
BEGIN
	if exists(select name from sys.sysobjects where name = N'New_Dept_budget' and xtype = N'U')
	begin
		drop Table New_dept_budget
	end
	create table NEW_Dept_Budget (
		Dept_No int NOT NULL,
		Dept_Name char(30) NOT NULL,
		COUNT_Emp int,
		New_SUM_Salary int,
		New_ave_Salary int)
	DECLARE @DeptName as varchar(15);
	DECLARE @DeptNumber as int;
	DECLARE @NoEmp as int;
	DECLARE @SumSalary as decimal(9,2);
	DECLARE @AveSalary as decimal(9,2);
	
	DECLARE @NewSumSalary as decimal(9,2);

	DECLARE @BudgetCursor as CURSOR;
	SET @BudgetCursor = CURSOR FOR
	SELECT *
	 from VDept_Budget;

	OPEN @BudgetCursor;

	FETCH NEXT FROM @BudgetCursor INTO @DeptName, @DeptNumber, @NoEmp, @SumSalary, @AveSalary;

	WHILE @@FETCH_STATUS = 0
		BEGIN
		IF(@DeptNumber = 1)
		BEGIN
			SET @NewSumSalary = @SumSalary * 1.1
			set @AveSalary = @NewSumSalary/@NoEmp
			insert into NEW_Dept_Budget values(@DeptNumber, @DeptName, @NoEmp, @NewSumSalary, @AveSalary);
		END
		IF (@DeptNumber = 4)
		BEGIN
			SET @NewSumSalary = @SumSalary * 1.2
			set @AveSalary = @NewSumSalary/@NoEmp
			insert into NEW_Dept_Budget values(@DeptNumber, @DeptName, @NoEmp, @NewSumSalary, @AveSalary);
		END
		IF (@DeptNumber = 5)
		BEGIN
			SET @NewSumSalary = @SumSalary * 1.3
			set @AveSalary = @NewSumSalary/@NoEmp
			insert into NEW_Dept_Budget values(@DeptNumber, @DeptName, @NoEmp, @NewSumSalary, @AveSalary);
		END
		IF (@DeptNumber = 7)
		BEGIN
			SET @NewSumSalary = @SumSalary * 1.4
			set @AveSalary = @NewSumSalary/@NoEmp
			insert into NEW_Dept_Budget values(@DeptNumber, @DeptName, @NoEmp, @NewSumSalary, @AveSalary);
		END
		FETCH NEXT FROM @BudgetCursor INTO @DeptName, @DeptNumber, @NoEmp, @SumSalary, @AveSalary;	
	END;
	
	CLOSE @BudgetCursor;
	DEALLOCATE @BudgetCursor;
END
GO

exec sp_Report_new_budget
select *
from NEW_Dept_Budget
select *
from VDept_Budget