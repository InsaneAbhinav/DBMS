-- Abhinav Singla
-- 500120278
CREATE Database exp11;
USE exp11;

CREATE TABLE EMPLOYEES (
    Employee_id CHAR(10) PRIMARY KEY,
    First_Name CHAR(30) NOT NULL,
    Last_Name CHAR(30) NOT NULL,
    DOB DATE,
    Salary INT NOT NULL,
    Department_id CHAR(10)
);

-- Insert Records into EMPLOYEES
INSERT INTO EMPLOYEES (Employee_id, First_Name, Last_Name, DOB, Salary, Department_id) 
VALUES 
    ('E001', 'John', 'Doe', '1990-05-10', 50000, 'D001'),
    ('E002', 'Jane', 'Smith', '1992-07-14', 60000, 'D002'),
    ('E003', 'Alice', 'Johnson', '1988-02-23', 55000, 'D001'),
    ('E004', 'Bob', 'Williams', '1994-11-12', 65000, 'D003'),
    ('E005', 'Charlie', 'Brown', '1990-03-19', 70000, 'D002'),
    ('E006', 'David', 'Davis', '1991-06-05', 72000, 'D003');
    
    

-- Create Index on Last_Name and Department_id
CREATE INDEX employee_idx ON EMPLOYEES (Last_Name, Department_id);

-- Create Unique Index on Employee_id
CREATE UNIQUE INDEX employee_id_idx ON EMPLOYEES (Employee_id);

-- Create Reverse Index on Employee_id
CREATE INDEX employee_id_reverse_idx ON EMPLOYEES (Employee_id DESC);

-- Create Unique Composite Index on Employee_id and Last_Name
CREATE UNIQUE INDEX emp_composite_idx ON EMPLOYEES (Employee_id, Last_Name);

-- Create Function-Based Index (UPPER) on Last_Name
CREATE INDEX emp_upper_last_name_idx ON EMPLOYEES (UPPER(Last_Name));

-- Drop Function-Based Index on Last_Name
DROP INDEX emp_upper_last_name_idx ON EMPLOYEES;

