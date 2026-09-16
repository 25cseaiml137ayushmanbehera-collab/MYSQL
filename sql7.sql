create database sql_join_exp_007;
use sql_join_exp_007;

create table Dept(
dept_no int primary key,
dept_name varchar (20) not null,
loc varchar (20)
);

create table employee(
emp_id int primary key,
emp_name varchar(20) not null,
job varchar(20),
mgr int,
hiredata date,
sal decimal(10,2),
comm decimal(10,2),
dept_no int,

constraint fk_emp_dept
foreign key (dept_no)
references Dept(dept_no)
);

desc employee;

create table salgrade(
grade int primary key,
losal decimal(10,2) not null,
hisal decimal(10,2) not null
);

desc salgrade;

create table areas(
area_id int primary key,
area_name varchar(20) not null,
location varchar(20)
);

insert into Dept(dept_no,dept_name,loc)
values
(10,'accounting','new york'),
(20, 'research','dallas'),
(30,'sales','chicago'),
(40,'operations','Boston'),
(50,'hr','delhi');

select *from Dept;

insert into employee(emp_id,emp_name,job,mgr,hiredata,sal,comm,dept_no)
values
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10),
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20),
(7788, 'SCOTT', 'ANALYST', 7566, '1987-04-19', 3000, NULL, 20),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 500, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30),
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30),
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20),
(7876, 'ADAMS', 'CLERK', 7788, '1987-05-23', 1100, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10);

insert into salgrade (grade,losal,hisal)
values
(1, 700, 1200),
(2, 1201, 1400),
(3, 1401, 2000),
(4, 2001, 3000),
(5, 3001, 9999);

select * from salgrade;
insert into areas(area_id,area_name,location)
values
(1, 'NORTH', 'DELHI'),
(2, 'SOUTH', 'CHENNAI'),
(3, 'EAST', 'KOLKATA'),
(4, 'WEST', 'MUMBAI');

select * from areas;
 commit;
 
 select e.emp_id,e.emp_name,d.dept_name,d.loc
 from   employee e,Dept d where e.dept_no = d.dept_no;
 
 select e.emp_id,e.emp_name,e.sal,s.grade
 from employee e,salgrade s where e.sal between s.losal and s.hisal;
 
SELECT e.emp_name AS Employee_Name,m.emp_name AS Manager_Name
FROM employee e LEFT JOIN employee m ON e.mgr = m.emp_id;
 
SELECT e.emp_id,e.emp_name,d.dept_no,d.dept_name
FROM employee e JOIN Dept d ON e.dept_no = d.dept_no;
