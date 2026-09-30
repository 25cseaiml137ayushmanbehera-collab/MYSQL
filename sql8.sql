create database studentdb;
use studentdb;
create table stdudent01(
student_id int primary key,
name varchar(50),
age int,
address varchar(100),
department varchar(30));

create table courses(
courseID int primary key,
courseName varchar(50) not null unique,
credits int not null,
capacity int not null default 60);

create table enrollments(
enrollmentid int auto_increment primary key,
studentid int not null,
courseid int not null,
enrollmentdate date not null,
 grade char(2),status);