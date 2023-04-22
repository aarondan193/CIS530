use COMPANY
Select D.Dnumber, E.dno, E.salary
From Department D Left Outer Join Employee E
ON D.Dnumber = E.dno;
/*Count(*) count a tuple of the join result*/
Select D.dnumber, Count(*), SUM(E.salary)
From Department D Left Outer Join Employee E
ON D.Dnumber = E.dno
Group By D.dnumber;
/* NULL as Group */
Select E.dno, Count(E.dno), SUM(E.salary)
From Department D Left Outer Join Employee E
ON D.Dnumber = E.dno
Group By E.dno;
 
/*COUNT counts Duplicates*/
Select Count(E.dno)
from employee E;
/*To COUNT Unique Values Only*/
Select Count(Distinct E.dno)
from employee E;
/*COUNT Does NOT count NULL values*/
Select Count(E.superssn)
from employee E;
 
Select D.dnumber, Count(E.dno), Sum(E.Salary)
From Department D Left Outer Join Employee E
 ON D.Dnumber = E.dno
Group By D.dnumber;
Select D.dnumber, Count(E.dno), Sum(E.Salary)
From Department D Left Outer Join Employee E
 ON D.Dnumber = E.dno
Group By D.dnumber
Having COUNT(E.dno) > 2;