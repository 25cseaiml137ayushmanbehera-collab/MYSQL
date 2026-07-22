create database employeeDB101;
use employeeDB101;

create table employeess12( 
emp_id int auto_increment primary key,emp_name varchar(50),
department varchar(30),salary decimal(10,2),
city varchar(30),join_date date);
create database companyEmployeeDB;
rename table employeeDB101.employeess12 to companyEmployeeDB.employees01;
drop database employeeDB101;
use companyEmployeeDB;
show tables;
drop database companyEmployeeDB;