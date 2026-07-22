create database employeedetails;
use employeedetails;
create table employeess( emp_id int auto_increment primary key,emp_name varchar(50),department varchar(30),salary decimal(10,2),city varchar(30),join_date date);0
insert into employeess(emp_name,department,salary,city,join_date)
values
('rohit sharma','it',55000.00,'bhubaneswar','2021-03-15'),
('ankita das','hr',42000.00,'kolkata','2020-07-22'),
('ayushman behera','it',61000.00,'delhi','2019-11-10'),
('priya mishra','sales',39000.00,'mumbai','2023-06-08');

select* from employeess;


insert into employeess(emp_name,department,salary,city,join_date)
values
('simran','finance',45000.00,'odisha','2018-10-09');

select*from employeess where department ='it'AND salary > 55000;
select* from employeess where department ='hr'OR department='finance';
select* from employees where city in ('bhubaneswar','delhi');
select*from employeess where salary between 45000 AND 60000;
select*from employeess where emp_name like 's%';

select*from employeess where department ='it'AND salary > 55000 AND city!='bhubaneswar';
select*from employeess where emp_name like '_n%';
