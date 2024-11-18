-- Ayush Vashishth
-- 500119331

CREATE DATABASE Hostel;
USE Hostel;
CREATE TABLE Person
(
PersonID int,
FirstName varchar(255),
Address varchar(255)
);
insert into Hostel.Person(PersonID,FirstName,Address) values(1,'Ayush','xyz123');
insert into Hostel.Person(PersonID,FirstName,Address) values(2,'Aryan','xyz456');
insert into Hostel.Person(PersonID,FirstName,Address) values(3,'Shaurya','xyz789');
insert into Hostel.Person(PersonID,FirstName,Address) values(4,'Abhinav','xyz025');
SELECT * FROM Hostel.person;