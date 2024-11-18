-- Abhinav Singla
-- 500120278

CREATE DATABASE exp9;
USE exp9;

CREATE TABLE EMPLOYEES (
    Employee_id CHAR(10) PRIMARY KEY,
    First_Name CHAR(30) NOT NULL,
    Last_Name CHAR(30) NOT NULL,
    DOB DATE,
    Salary INT NOT NULL,
    Department_id CHAR(10)
);

-- Inserting 6 rows of sample data
INSERT INTO EMPLOYEES (Employee_id, First_Name, Last_Name, DOB, Salary, Department_id) VALUES
('E001', 'John', 'Doe', '1985-06-12', 60000, '10'),
('E002', 'Jane', 'Smith', '1990-11-03', 75000, '20'),
('E003', 'Jim', 'Brown', '1982-01-25', 50000, '10'),
('E004', 'Sara', 'Jones', '1987-04-18', 85000, '20'),
('E005', 'Michael', 'Davis', '1992-07-14', 65000, '30'),
('E006', 'Emily', 'White', '1989-09-29', 72000, '20');

CREATE VIEW emp_view AS
SELECT Employee_id, Last_Name, Salary, Department_id
FROM EMPLOYEES;

ALTER TABLE EMPLOYEES MODIFY First_Name CHAR(30);
ALTER TABLE EMPLOYEES MODIFY Last_Name CHAR(30);

ALTER TABLE EMPLOYEES MODIFY First_Name CHAR(30) NOT NULL;
ALTER TABLE EMPLOYEES MODIFY Last_Name CHAR(30) NOT NULL;

INSERT INTO EMPLOYEES (Employee_id, First_Name, Last_Name, Salary, Department_id) VALUES
('E007', 'Peter', 'Green', 58000, '30');


UPDATE emp_view
SET Salary = 70000
WHERE Employee_id = 'E002';
DELETE FROM emp_view
WHERE Employee_id = 'E003';
DROP VIEW emp_view;

CREATE VIEW salary_view AS
SELECT Employee_id, First_Name, Last_Name, Salary * 12 AS Annual_Salary
FROM EMPLOYEES
WHERE Department_id = '20';





