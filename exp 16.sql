-- Abhinav Singla
-- 500120278

CREATE DATABASE CustomerDB;
USE CustomerDB;

CREATE TABLE CUSTOMER (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    AGE INT,
    ADDRESS VARCHAR(100),
    SALARY DECIMAL(10, 2)
);

INSERT INTO CUSTOMER (ID, NAME, AGE, ADDRESS, SALARY) VALUES
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
(2, 'Khilan', 25, 'Delhi', 1500.00),
(3, 'Kaushik', 23, 'Kota', 2000.00),
(4, 'Chaitali', 25, 'Mumbai', 6500.00),
(5, 'Hardik', 27, 'Bhopal', 8500.00),
(6, 'Komal', 22, 'MP', 4500.00);


CREATE DATABASE IF NOT EXISTS CustomerDB;
USE CustomerDB;

CREATE TABLE IF NOT EXISTS CUSTOMER (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    AGE INT,
    ADDRESS VARCHAR(100),
    SALARY DECIMAL(10, 2)
);

INSERT INTO CUSTOMER (ID, NAME, AGE, ADDRESS, SALARY) VALUES
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
(2, 'Khilan', 25, 'Delhi', 1500.00),
(3, 'Kaushik', 23, 'Kota', 2000.00),
(4, 'Chaitali', 25, 'Mumbai', 6500.00),
(5, 'Hardik', 27, 'Bhopal', 8500.00),
(6, 'Komal', 22, 'MP', 4500.00);


DELIMITER $$

CREATE TRIGGER after_customer_insert
AFTER INSERT ON CUSTOMER
FOR EACH ROW
BEGIN
    -- Display the salary difference (only new salary for an INSERT)
    SELECT CONCAT('Salary Difference (INSERT): ', NEW.SALARY, ' (New salary)') AS salary_diff;
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER after_customer_update
AFTER UPDATE ON CUSTOMER
FOR EACH ROW
BEGIN
    -- Display the salary difference between old and new salary
    SELECT CONCAT('Salary Difference (UPDATE): ', OLD.SALARY - NEW.SALARY, ' (Old salary - New salary)') AS salary_diff;
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER after_customer_delete
AFTER DELETE ON CUSTOMER
FOR EACH ROW
BEGIN
    -- Display the old salary (only old salary for a DELETE)
    SELECT CONCAT('Salary Difference (DELETE): ', OLD.SALARY, ' (Old salary)') AS salary_diff;
END $$

DELIMITER ;


-- Insert a new customer record
INSERT INTO CUSTOMER (ID, NAME, AGE, ADDRESS, SALARY) VALUES (7, 'Sanjay', 30, 'Pune', 5000.00);
-- Update the salary of an existing customer (e.g., update Hardik's salary)
UPDATE CUSTOMER SET SALARY = 9000.00 WHERE ID = 5;
-- Delete a customer record
DELETE FROM CUSTOMER WHERE ID = 7;
