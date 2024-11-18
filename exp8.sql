-- Abhinav Singla
-- 500120278

CREATE DATABASE exp8;
USE exp8; 

-- Creating Student table
CREATE TABLE Student (
    sid INT PRIMARY KEY,
    sname VARCHAR(50),
    age INT
);

-- Creating Match table
CREATE TABLE Matches (
    mid VARCHAR(10) PRIMARY KEY,
    mname VARCHAR(50),
    venue VARCHAR(50)
);

-- Creating Play table
CREATE TABLE Play (
    sid INT,
    mid VARCHAR(10),
    day DATE,
    FOREIGN KEY (sid) REFERENCES Student(sid),
    FOREIGN KEY (mid) REFERENCES Matches(mid)
);

-- Inserting into Student table
INSERT INTO Student (sid, sname, age) VALUES (1, 'Amit', 20);
INSERT INTO Student (sid, sname, age) VALUES (2, 'Rahul', 22);
INSERT INTO Student (sid, sname, age) VALUES (3, 'Sara', 21);
INSERT INTO Student (sid, sname, age) VALUES (4, 'John', 23);

-- Inserting into Matches table
INSERT INTO Matches (mid, mname, venue) VALUES ('B10', 'Cricket', 'Delhi');
INSERT INTO Matches (mid, mname, venue) VALUES ('B11', 'Football', 'Mumbai');
INSERT INTO Matches (mid, mname, venue) VALUES ('B12', 'Tennis', 'Delhi');
INSERT INTO Matches (mid, mname, venue) VALUES ('B13', 'Badminton', 'Chennai');

-- Inserting into Play table
INSERT INTO Play (sid, mid, day) VALUES (1, 'B10', '2024-10-05');
INSERT INTO Play (sid, mid, day) VALUES (1, 'B11', '2024-10-06');
INSERT INTO Play (sid, mid, day) VALUES (2, 'B10', '2024-10-06');
INSERT INTO Play (sid, mid, day) VALUES (3, 'B12', '2024-10-07');
INSERT INTO Play (sid, mid, day) VALUES (4, 'B13', '2024-10-07');
INSERT INTO Play (sid, mid, day) VALUES (3, 'B11', '2024-10-08');

SELECT Student.*
FROM Student
JOIN Play ON Student.sid = Play.sid
WHERE Play.mid = 'B10';

SELECT Matches.mname
FROM Matches
JOIN Play ON Matches.mid = Play.mid
JOIN Student ON Student.sid = Play.sid
WHERE Student.sname = 'Amit';

SELECT DISTINCT Student.sname
FROM Student
JOIN Play ON Student.sid = Play.sid
JOIN Matches ON Play.mid = Matches.mid
WHERE Matches.venue = 'Delhi';

SELECT DISTINCT Student.sname
FROM Student
JOIN Play ON Student.sid = Play.sid;

SELECT Student.sid, Student.sname
FROM Student
JOIN Play ON Student.sid = Play.sid
GROUP BY Student.sid, Play.day
HAVING COUNT(DISTINCT Play.mid) >= 2;

SELECT DISTINCT Student.sid
FROM Student
JOIN Play ON Student.sid = Play.sid
JOIN Matches ON Play.mid = Matches.mid
WHERE Matches.venue IN ('Delhi', 'Mumbai');

SELECT AVG(age) AS average_age
FROM Student;

