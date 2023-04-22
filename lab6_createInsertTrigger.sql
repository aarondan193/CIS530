use Company_Lab6
go

create or alter trigger Trig_InsertAudit_EmpSalary on Employee
for INSERT
as
BEGIN
	INSERT INTO Audit_EmpSalary 
	([DATE_OF_CHANGE],[DML_TYPE],[OLD_SSN],[NEW_SSN],[OLD_Salary],[NEW_Salary],[OLD_DNO],[NEW_DNO])
	SELECT
	GETDATE(),'Insert',NULL,I.SSN,NULL,I.SALARY,NULL,I.DNO FROM
	INSERTED I

End