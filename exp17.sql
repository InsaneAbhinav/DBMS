-- Abhinav Singla
-- 500120278

CREATE DATABASE IF NOT EXISTS EmployeeDB;
USE EmployeeDB;

CREATE TABLE EMPLOYEE (
    FNAME VARCHAR(50),
    LNAME VARCHAR(50),
    SSN CHAR(9) PRIMARY KEY, -- SSN should be unique
    BDATE DATE,
    ADDRESS VARCHAR(100),
    SEX CHAR(1),
    SALARY DECIMAL(10, 2),
    SUPERVISOR_SSN CHAR(9), -- assuming supervisor SSN is also a unique value
    DNO INT -- Department Number
);

INSERT INTO EMPLOYEE (FNAME, LNAME, SSN, BDATE, ADDRESS, SEX, SALARY, SUPERVISOR_SSN, DNO) VALUES
('John', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston TX', 'M', 30000, '333445555', 5),
('Franklin', 'Wong', '333445555', '1965-12-08', '638 Voss, Houston TX', 'M', 40000, '888665555', 5),
('Alicia', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Spring TX', 'F', 25000, '987654321', 4),
('Jennifer', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire TX', 'F', 43000, '888665555', 4),
('Ramesh', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble TX', 'M', 38000, '333445555', 5),
('Joyce', 'English', '453453453', '1972-07-31', '5631 Rice, Houston TX', 'F', 25000, '333445555', 5),
('Ahmad', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston TX', 'M', 25000, '987654321', 4),
('James', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston TX', 'M', 55000, NULL, 1);

DELIMITER $$

CREATE TRIGGER SALARY_VIOLATION
BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
    -- Check if the salary is valid (must be non-negative)
    IF NEW.SALARY < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative!';
    END IF;
    
    -- Check if the supervisor SSN is valid (must not be NULL and must exist in the EMPLOYEE table)
    IF NEW.SUPERVISOR_SSN IS NOT NULL AND NOT EXISTS (
        SELECT 1 FROM EMPLOYEE WHERE SSN = NEW.SUPERVISOR_SSN
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Supervisor SSN does not exist!';
    END IF;
    
END $$

DELIMITER ;


-- Insert with negative salary (should trigger an error)
INSERT INTO EMPLOYEE (FNAME, LNAME, SSN, BDATE, ADDRESS, SEX, SALARY, SUPERVISOR_SSN, DNO)
VALUES ('Alice', 'Doe', '123987654', '1985-11-23', '1234 Elm St, Dallas TX', 'F', -5000, '333445555', 5);
-- Update with an invalid supervisor SSN (should trigger an error)
UPDATE EMPLOYEE 
SET SUPERVISOR_SSN = '999999999'
WHERE SSN = '123456789';

select * from Employee;
