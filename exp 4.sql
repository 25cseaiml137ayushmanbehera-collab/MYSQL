-- Create Database
CREATE DATABASE IF NOT EXISTS employee_db;
USE employee_db;

-- Create Employee Table
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    EmpName VARCHAR(30) NOT NULL,
    Designation VARCHAR(30),
    Salary DECIMAL(10,2),
    City VARCHAR(30)
);

-- Insert Suitable Records
INSERT INTO Employee (EmpName, Designation, Salary, City) VALUES
('SAM', 'Manager', 30000, 'Bhubaneswar'),
('PETER', 'Developer', 25000, 'Berhampur'),
('RAHUL', 'Developer', 18000, 'Cuttack'),
('SUNIL', 'Tester', 12000, 'Bhubaneswar'),
('AMIT', 'Designer', 15000, 'Puri'),
('RAVI', 'Developer', 35000, 'Bangalore'),
('ALLEN', 'Manager', 40000, 'Delhi'),
('SURAJ', 'Tester', 10000, 'Hyderabad'),
('KIRAN', 'Analyst', NULL, 'Kolkata'),
('JOHN', 'Analyst', 28000, 'Mumbai');

SELECT * FROM Employee WHERE Salary BETWEEN 10000 AND 30000;

SELECT * FROM Employee WHERE Salary NOT BETWEEN 10000 AND 30000;

SELECT *FROM Employee WHERE Designation IN ('Developer', 'Manager');

SELECT *FROM Employee WHERE Designation NOT IN ('Developer', 'Manager');

SELECT *FROM Employee WHERE Salary IS NULL;


SELECT *FROM Employee WHERE Salary IS NOT NULL;

SELECT *FROM Employee WHERE EmpName LIKE 'S%';

SELECT *FROM Employee WHERE EmpName LIKE '%R';

SELECT *FROM Employee WHERE EmpName LIKE '%U%';

SELECT *FROM Employee WHERE EmpName LIKE '%A%';

SELECT *FROM Employee WHERE EmpName LIKE '%LL%';

SELECT *FROM Employee WHERE EmpName LIKE '%E%';

SELECT *FROM Employee WHERE Salary = 25000;

SELECT *FROM Employee WHERE Salary != 25000;

SELECT *FROM Employee WHERE Salary > 25000;

SELECT *FROM Employee WHERE Salary < 25000;

	
SELECT *FROM Employee WHERE Salary >= 25000;

SELECT *FROM Employee WHERE Salary <= 25000;


SELECT *FROM Employee WHERE Designation = 'Developer'AND Salary > 15000;

SELECT *FROM Employee WHERE Designation = 'Manager'OR Salary > 30000;

SELECT *FROM Employee ORDER BY EmpName ASC;

SELECT *FROM Employee ORDER BY EmpName DESC;

SELECT DISTINCT Designation FROM Employee;

SELECT Designation, COUNT(*) AS Employee_Count FROM Employee GROUP BY Designation;

SELECT Designation, COUNT(*) AS Employee_Count FROM Employee GROUP BY Designation HAVING COUNT(*) > 1;

SELECT Designation, AVG(Salary) AS Average_Salary FROM Employee GROUP BY Designation HAVING AVG(Salary) > 20000;

DELETE FROM Employee WHERE EmpName LIKE 'S%';

UPDATE Employee SET Salary = Salary * 1.10 WHERE EmpName LIKE 'R%';

SELECT *
FROM Employee
WHERE EmpName LIKE 'R%';


SELECT EmpName, Salary,
       Salary * 0.10 AS Bonus
FROM Employee;


SELECT EmpName, Salary,
       Salary * 2 AS Double_Salary
FROM Employee;


SELECT EmpName, Salary,
       Salary + (Salary * 0.10) AS Salary_With_Bonus
FROM Employee;


