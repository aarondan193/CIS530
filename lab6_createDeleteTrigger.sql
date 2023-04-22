use Company_Lab6
go

create or alter trigger Trig_DeleteAudit_EmpSalary on Employee
FOR DELETE
AS
BEGIN
	INSERT INTO Audit_EmpSalary 
	([DATE_OF_CHANGE],[DML_TYPE],[OLD_SSN],[NEW_SSN],[OLD_Salary],[NEW_Salary],[OLD_DNO],[NEW_DNO])
	SELECT
	GETDATE(),'Delete',D.SSN,NULL,D.SALARY,NULL,D.DNO,NULL FROM
	DELETED D
End