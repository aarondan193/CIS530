
Select E2.ssn, E2.fname, E2.lname
From Employee E1, Employee E2
Where E1.superssn = E2.ssn 
Union all
Select E3.ssn, E3.fname, E3.lname
From Employee E3, Department D
Where D.MGR_SSN = E3.ssn; 

Select E2.ssn, E2.fname, E2.lname
From Employee E1, Employee E2
Where E1.superssn = E2.ssn
INTERSECT
Select E3.ssn, E3.fname, E3.lname
From Employee E3, Department D
Where D.mgr_ssn = E3.ssn;

Select E3.ssn, E3.fname, E3.lname
From Employee E3, Department D
Where D.mgr_ssn = E3.ssn
INTERSECT
Select E2.ssn, E2.fname, E2.lname
From Employee E1, Employee E2
Where E1.superssn = E2.ssn;

Select E3.ssn, E3.fname, E3.lname
From Employee E3, Department D
Where D.mgr_ssn = E3.ssn
Except
Select E2.ssn, E2.fname, E2.lname
From Employee E1, Employee E2
Where E1.superssn = E2.ssn;

Select E2.ssn, E2.fname, E2.lname
From Employee E1, Employee E2
Where E1.superssn = E2.ssn
Except
Select E3.ssn, E3.fname, E3.lname
From Employee E3, Department D
Where D.mgr_ssn = E3.ssn;

select E.Ssn, E.Lname, D.DEPENDANT_NAME
from Employee E, DEPENDANT D
where E.ssn = D.Essn;





Select E2.ssn, E2.fname, E2.lname
From Employee E1, Employee E2
Where E1.superssn = E2.ssn
UNION
Select E3.ssn, E3.fname, E3.lname
From Employee E3, Department D
Where D.mgr_ssn = E3.ssn; 

Select E2.ssn, E2.fname, E2.lname
From Employee E1, Employee E2
Where E1.superssn = E2.ssn
Except
Select E3.ssn, E3.fname, E3.lname
From Employee E3, Department D
Where D.mgr_ssn = E3.ssn;

Select E3.ssn, E3.fname, E3.lname
From Employee E3, Department D
Where D.mgr_ssn = E3.ssn
Except
Select E2.ssn, E2.fname, E2.lname
From Employee E1, Employee E2
Where E1.superssn = E2.ssn;
