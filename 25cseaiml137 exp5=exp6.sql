use companydb;
create table employee61(
emp_id int primary key auto_increment,
emp_name varchar(50) not null,
desigination varchar(40),
salary decimal(10,2),
department varchar(40))
auto_increment=1000;

alter table employee61 add column DOJ date;
desc employee61;

insert into employee61 (emp_name,desigination,salary,department,DOJ)
values
('amit behera','Web Developer',45000.23,'it','2024-02-12'),
('abhishek pratap','HR',56000.23,'finance','2023-03-10'),
('priya','SDE',80000.56,'it','2024-12-12'),
('neha','Manager',89000.56,'banking','2025-05-06'),
('bibek','Software Tester',62000.45,'it','2020-12-01');


select * from Employee61;
select emp_Name,upper(emp_name) as UPEER_NAME_CASE,
lower(emp_name) as LOWER_NAME_CASE from employee61;

select emp_name,LENGTH(emp_name)
as length_of_emp_name
from employee61;

select concat(emp_name,'_',desigination,'_',department)as employee_details from employee61;

select emp_name,substring(emp_name,1,3)
as sub_part_of_name from employee61;

select salary,round(salary,1) as overall_salary
from employee61;

select emp_name,ABS(salary - 5000) as desuction_of_salary from employee61;

select emp_name, datediff(curdate(),DOJ)
AS days_of_service,
round(datediff(curdate(),DOJ)/365,1)as year_of_service from employee61;

select department,
 count(*) as total_employee,
max(salary) as max_salary,
min(salary) as min_salary,
avg(salary) as average_salary,
sum(salary) as total_salary
from employee61 group by department;