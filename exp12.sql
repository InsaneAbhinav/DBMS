-- Abhinav Singla
-- 500120278

-- create a database. This is just an example.
CREATE DATABASE exp12;
USE exp12;

CREATE TABLE employee (
    employee_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    PRIMARY KEY (employee_id)
);

-- The employee_id will automatically start from 1 and increment by 1 for each new row
-- To simulate the starting value of 100, set the AUTO_INCREMENT value to 100
ALTER TABLE employee AUTO_INCREMENT = 100;


-- Find the current auto-increment value
SHOW TABLE STATUS LIKE 'employee';

-- To get the next value (simulating the next value of a sequence)
SELECT AUTO_INCREMENT 
FROM information_schema.tables
WHERE table_name = 'employee';

-- Set the AUTO_INCREMENT value to simulate the cache or maxvalue
ALTER TABLE employee AUTO_INCREMENT = 1000;

-- Insert rows; employee_id will automatically increment starting from 100
INSERT INTO employee (name) VALUES ('John Doe');
INSERT INTO employee (name) VALUES ('Jane Smith');
INSERT INTO employee (name) VALUES ('Michael Johnson');
INSERT INTO employee (name) VALUES ('Emily Davis');

-- After inserting, the employee_id for the rows will be:
-- John Doe -> 100
-- Jane Smith -> 101
-- Michael Johnson -> 102
-- Emily Davis -> 103

-- Drop the table, simulating dropping the sequence
DROP TABLE IF EXISTS employee;

-- Create a stored procedure to simulate the reverse sequence
DELIMITER $$

CREATE PROCEDURE reverse_sequence()
BEGIN
    DECLARE i INT DEFAULT 10000;
    
    WHILE i >= 1000 DO
        SELECT i;
        SET i = i - 5;
    END WHILE;
END$$

DELIMITER ;

-- Call the procedure to generate the sequence
CALL reverse_sequence();

-- Output will be:
-- 10000, 9995, 9990, 9985, ..., 1005, 1000

