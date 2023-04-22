use Company_Lab6
go

create or alter trigger Trig_UpdateAudit_EmpSalary on Employee
for UPDATE
as
BEGIN
	INSERT INTO Audit_EmpSalary 
	([DATE_OF_CHANGE],[DML_TYPE],[OLD_SSN],[NEW_SSN],[OLD_Salary],[NEW_Salary],[OLD_DNO],[NEW_DNO])
	SELECT
	GETDATE(),'Update',D.SSN,I.SSN,D.SALARY,I.SALARY,D.DNO,I.DNO FROM
	DELETED AS D JOIN INSERTED AS I ON I.SSN=D.SSN
End