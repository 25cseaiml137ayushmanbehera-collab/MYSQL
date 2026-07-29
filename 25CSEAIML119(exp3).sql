CREATE DATABASE IF NOT EXISTS lab_ddl_dm1;
USE lab_ddl_dm1;

CREATE TABLE Persons (
    PersonID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Age INT,
    City VARCHAR(20),
    Email VARCHAR(50)
);
DESC Persons;

INSERT INTO persons(FirstName, LastName, Age, City, Email)
VALUES('Amit', 'Rao', 24, 'BBSR', 'amit.do@example.com'),
('Ayush', 'Kumar', 20, 'Jharkhand', 'ayush.do@example.com'),
('Pritam', 'Singh', 22, 'Bihar', 'pritam.do@example.com'),
('Rohit', 'Singh', 19, 'Jharkhand', 'rohit.do@example.com');

SELECT FirstName, City FROM Persons WHERE City = 'BBSR';

SELECT FirstName, LastName, City FROM Persons;

ALTER Table Persons ADD Phone VARCHAR(15);

ALTER Table Persons DROP Email;

ALTER TABLE Persons MODIFY Phone VARCHAR(15);



DROP TABLE Emplyee;

CREATE TABLE Employee (
    EmpID INT AUTO_INCREMENT PRIMARY KEY,
    EmpName VARCHAR(20) NOT NULL,
    Department VARCHAR(20),
    Salary DECIMAL(10,2)
);

INSERT INTO Employee(EmpName, Department, Salary)
VALUES('Kabir', 'Sales', 32000.00),
('Vishal', 'IT', 40000.00),
('Suresh', 'HR', 60000.00);

RENAME TABLE Employee to Staff;

UPDATE Staff SET Department= 'Marketing' WHERE EmpID=1;

SELECT *FROM Staff WHERE EmpID=1;

DELETE FROM Staff WHERE EmpID=3;

SELECT * FROM Staff;



truncate TABLE persons;

SELECT * FROM Persons;
DESC Persons;

Drop Table Persons;