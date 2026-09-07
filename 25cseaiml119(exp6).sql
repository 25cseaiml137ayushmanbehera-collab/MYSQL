CREATE DATABASE IF NOT EXISTS db_constraints;
USE db_constraints;
drop database db_constraints;
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50) NOT NULL
);

DESC Department;

INSERT INTO Department (Dept_ID, Dept_Name)
VALUES
(101, 'Computer Science'),
(102, 'Information Technology'),
(103, 'Electronics'),
(104, 'Mechanical');

SELECT * FROM Department;

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY auto_increment,
    Emp_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Salary DECIMAL(10,2) DEFAULT 20000,
    Joining_Date DATE DEFAULT (CURRENT_DATE),
    Mobile_No VARCHAR(15),
    Dept_ID INT
) auto_increment=1000;

DESC Employee;

ALTER TABLE Employee
ADD CONSTRAINT fk_employee_department
FOREIGN KEY (Dept_ID)
REFERENCES Department(Dept_ID);

DESC Employee;

ALTER TABLE Employee
ADD CONSTRAINT chk_salary
CHECK (Salary >= 10000);

DESC Employee;

ALTER TABLE Employee
ADD CONSTRAINT uq_mobile
UNIQUE (Mobile_No);

DESC Employee;

DESC Department;

DESC Employee;

INSERT INTO Employee
(Emp_ID, Emp_Name, Email, Salary, Joining_Date, Mobile_No, Dept_ID)
VALUES
(1, 'Rahul', 'rahul@gmail.com', 25000, '2025-01-10', '9876543210', 101),
(2, 'Sneha', 'sneha@gmail.com', 30000, '2025-02-15', '9876543211', 102),
(3, 'Amit', 'amit@gmail.com', 22000, '2025-08-12', '9876543212', 103);

SELECT * FROM Employee;

INSERT INTO Employee
(Emp_ID, Emp_Name, Email, Salary, Mobile_No, Dept_ID)
VALUES
(1, 'Karan', 'karan@gmail.com', 25000, '9876543213', 101);

INSERT INTO Employee
(Emp_ID, Emp_Name, Email, Salary, Mobile_No, Dept_ID)
VALUES
(4, 'Ravi', 'ravi@gmail.com', 25000, '9876543214', 999);

INSERT INTO Employee
(Emp_ID, Emp_Name, Email, Salary, Mobile_No, Dept_ID)
VALUES
(4, 'Ravi', 'rahul@gmail.com', 25000, '9876543214', 101);

INSERT INTO Employee
(Emp_ID, Emp_Name, Email, Salary, Mobile_No, Dept_ID)
VALUES
(4, NULL, 'ravi@gmail.com', 25000, '9876543214', 101);

INSERT INTO Employee
(Emp_ID, Emp_Name, Email, Salary, Mobile_No, Dept_ID)
VALUES
(4, 'Ravi', 'ravi@gmail.com', 5000, '9876543214', 101);

INSERT INTO Employee
(Emp_ID, Emp_Name, Email, Salary, Mobile_No, Dept_ID)
VALUES
(4, 'Ravi', 'ravi@gmail.com', 25000, '9876543210', 101);

INSERT INTO Employee
(Emp_ID, Emp_Name, Email, Mobile_No, Dept_ID)
VALUES
(4, 'Ravi', 'ravi@gmail.com', '9876543214', 101);

SELECT * FROM Employee
WHERE Emp_ID = 4;

ALTER TABLE Employee
ALTER COLUMN Salary SET DEFAULT 25000;

ALTER TABLE Employee
MODIFY Salary DECIMAL(10,2) DEFAULT 25000;

ALTER TABLE Employee
DROP INDEX uq_mobile;

ALTER TABLE Employee
DROP FOREIGN KEY fk_department;

ALTER TABLE Employee
DROP CHECK chk_salary;

SELECT * FROM Department;

SELECT * FROM Employee;
