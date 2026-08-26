create database companydb;

use companydb;

create table Department(
DepartementID int PRIMARY KEY,
DepartmentName varchar(50) NOT NULL);

desc Department;

insert into Department(DepartementID,DepartmentName) values
(101,'computer science'),
(102,'human resources'),
(103,'finance'),
(104,'marketing');

select* from Department;

create table Employee17(
EmployeeID int primary key,
EmployeeName varchar(100) NOT NULL,
Email varchar(100) unique,
MobileNumber varchar(15),
Salary decimal(10,2) default 25000.00,
JoiningDate date default(current_date),
DepartmentId int);

desc Employee17;

alter table Employee17
add constraint chk_employee_salary
check(Salary >=10000);

alter table Employee17
add constraint uq_empoyee_mobile
unique(MobileNumber);

