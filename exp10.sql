-- Abhinav Singla
-- 500120278

-- USE the Company database
USE company;

-- Select employee names for a specific project and department
SELECT E.Fname, E.Lname
FROM EMPLOYEE E
JOIN WORKS_ON W ON E.Ssn = W.Essn
JOIN PROJECT P ON W.Pno = P.Pnumber
WHERE E.Dno = 5 AND P.Pname = 'ProductX' AND W.Hours > 10;

-- View: Employee Name, Supervisor Name, and Employee Salary for Each Employee Who Works in the ‘Research’ Department
CREATE VIEW Research_Employees AS
SELECT E.Fname AS employee_name, 
       S.Fname AS supervisor_name, 
       E.Salary
FROM EMPLOYEE E
JOIN EMPLOYEE S ON E.Super_ssn = S.Ssn
WHERE E.Dno = 5;

-- View: Project Name, Controlling Department Name, Number of Employees, and Total Hours Worked per Week on Each Project
CREATE VIEW Project_Stats AS
SELECT P.Pname AS proj_name, 
       D.Dname AS controlling_department, 
       COUNT(W.Essn) AS num_employees, 
       SUM(W.Hours) AS total_hours
FROM PROJECT P
JOIN WORKS_ON W ON P.Pnumber = W.Pno
JOIN DEPARTMENT D ON P.Dnum = D.Dnumber
GROUP BY P.Pname, D.Dname;

-- View: Projects with Multiple Employees
CREATE VIEW Project_Multiple_Employees AS
SELECT P.Pname AS proj_name, 
       D.Dname AS controlling_department, 
       COUNT(W.Essn) AS num_employees, 
       SUM(W.Hours) AS total_hours
FROM PROJECT P
JOIN WORKS_ON W ON P.Pnumber = W.Pno
JOIN DEPARTMENT D ON P.Dnum = D.Dnumber
GROUP BY P.Pname, D.Dname
HAVING COUNT(W.Essn) > 1;
