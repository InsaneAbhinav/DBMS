-- Ayush Vashishth
-- 500119331

CREATE DATABASE Supplier;
USE Supplier;
-- Supplier Table
CREATE TABLE Supplier (
scode INT PRIMARY KEY,
sname VARCHAR(50),
scity VARCHAR(50),
turnover DECIMAL(10, 2)
);
-- Part Table
CREATE TABLE Part (
pcode INT PRIMARY KEY,
weigh DECIMAL(10, 2),
color VARCHAR(20),
cost DECIMAL(10, 2),
sellingprice DECIMAL(10, 2)
);
-- Supplier_Part Table (Many-to-Many relationship)
CREATE TABLE Supplier_Part (
scode INT,
pcode INT,
qty INT,
PRIMARY KEY (scode, pcode),
FOREIGN KEY (scode) REFERENCES Supplier(scode),
FOREIGN KEY (pcode) REFERENCES Part(pcode)
);
-- Insert data into Supplier
INSERT INTO Supplier VALUES
(1, 'Supplier1', 'Bombay', 50.00),
(2, 'Supplier2', 'Delhi', 75.00),
(3, 'Supplier3', 'Bombay', NULL);
-- Insert data into Part
INSERT INTO Part VALUES
(1, 30, 'Red', 20.00, 25.00),
(2, 40, 'Blue', 30.00, 35.00),
(3, 35, 'Green', 40.00, 50.00);
-- Insert data into Supplier_Part
INSERT INTO Supplier_Part VALUES
(1, 1, 100),
(1, 2, 200),
(2, 3, 150),
(3, 2, 120);

SELECT scode, pcode
FROM Supplier_Part
ORDER BY scode ASC;

SELECT *
FROM Supplier
WHERE scity = 'Bombay' AND turnover = 50;

SELECT COUNT(*) AS total_suppliers
FROM Supplier;

SELECT pcode
FROM Part
WHERE weigh BETWEEN 25 AND 35;

SELECT scode
FROM Supplier
WHERE turnover IS NULL;

SELECT pcode
FROM Part
WHERE cost IN (20, 30, 40);

SELECT SUM(qty) AS total_quantity
FROM Supplier_Part
WHERE pcode = 2;

SELECT sname
FROM Supplier
WHERE scode IN (SELECT scode
FROM Supplier_Part
WHERE pcode = 2);

SELECT pcode
FROM Part
WHERE cost > (SELECT AVG(cost) FROM Part);

SELECT scode, turnover
FROM Supplier
ORDER BY turnover DESC;
