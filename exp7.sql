-- Ayush Vashishth
-- 500119331

CREATE DATABASE company;
USE company;
CREATE TABLE EMPLOYEE (
    Fname VARCHAR(15) NOT NULL,     
    Minit CHAR,
    Lname VARCHAR(15) NOT NULL,
    Ssn CHAR(9) NOT NULL,
    Bdate DATE,
    Address VARCHAR(30),
    Sex CHAR,
    Salary DECIMAL(10,2),     
    Super_ssn CHAR(9),
    Dno INT NOT NULL
);

INSERT INTO EMPLOYEE (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) VALUES
('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston TX', 'M', 30000, '333445555', 5),
('Franklin', 'T', 'Wong', '333445555', '1965-12-08', '638 Voss, Houston TX', 'M', 40000, '888665555', 5),
('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Spring TX', 'F', 25000, '987654321', 4),
('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire TX', 'F', 43000, '888665555', 4),
('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble TX', 'M', 38000, '333445555', 5),
('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston TX', 'F', 25000, '333445555', 5),
('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston TX', 'M', 25000, '987654321', 4),
('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston TX', 'M', 55000, NULL, 1);

CREATE TABLE DEPARTMENT (
    Dname VARCHAR(15) NOT NULL,
    Dnumber INT NOT NULL,
    Mgr_ssn CHAR(9) NOT NULL,
    Mgr_start_date DATE
);

INSERT INTO DEPARTMENT (Dname, Dnumber, Mgr_ssn, Mgr_start_date) VALUES
('Research', 5, '333445555', '1988-05-22'),
('Administration', 4, '987654321', '1995-01-01'),
('Headquarters', 1, '888665555', '1981-06-19');

CREATE TABLE PROJECT (
    Pname VARCHAR(15) NOT NULL,
    Pnumber INT NOT NULL,
    Plocation VARCHAR(15),
    Dnum INT NOT NULL
);

INSERT INTO PROJECT (Pname, Pnumber, Plocation, Dnum) VALUES
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);


CREATE TABLE WORKS_ON (
    Essn CHAR(9) NOT NULL,
    Pno INT NOT NULL,
    Hours DECIMAL(3,1) NOT NULL
);

INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES
('123456789', 1, 32.5),
('123456789', 2, 7.5),
('666884444', 3, 40.0),
('453453453', 1, 20.0);

CREATE TABLE DEPENDENT (
    Essn CHAR(9) NOT NULL,
    Dependent_name VARCHAR(15) NOT NULL,
    Relationship VARCHAR(15)
);

-- Insert data into DEPENDENT
INSERT INTO DEPENDENT (Essn, Dependent_name, Relationship) VALUES
('123456789', 'Alice', 'Daughter'),
('333445555', 'Mike', 'Son'),
('999887777', 'Sara', 'Daughter');

 SELECT E.Fname, E.Lname
 FROM Employee E
 JOIN Works_On W ON E.Ssn = W.Essn
 JOIN Project P ON W.Pno = P.Pnumber
 WHERE E.Dno = 5 AND P.Pname = 'ProductX' AND W.Hours > 10;
 
 SELECT E.Fname, E.Lname
 FROM Employee E
 JOIN Dependent D ON E.Ssn = D.Essn
 WHERE E.Fname = D.Dependent_name;

SELECT E.Fname, E.Lname
FROM Employee E
JOIN Employee S ON E.Super_ssn = S.Ssn
WHERE S.Fname = 'Franklin' AND S.Lname = 'Wong';

SELECT E.Fname, E.Lname
FROM Employee E
WHERE NOT EXISTS (
SELECT P.Pnumber
FROM Project P
WHERE NOT EXISTS (
SELECT W.Pno
FROM Works_On W
WHERE W.Essn = E.Ssn AND W.Pno = P.Pnumber
)
);
 
SELECT E.Fname, E.Lname
FROM Employee E
LEFT JOIN Works_On W ON E.Ssn = W.Essn
WHERE W.Pno IS NULL;
 
SELECT E.Lname
FROM Employee E
JOIN Department D ON E.Ssn = D.Mgr_ssn
LEFT JOIN Dependent Dep ON E.Ssn = Dep.Essn
WHERE Dep.Essn IS NULL;
