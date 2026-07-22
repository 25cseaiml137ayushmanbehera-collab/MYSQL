create database lab_ddl_dml;
use lab_ddl_dml;
create table persons(
personalID int auto_increment primary key,
Firstname varchar(20) not NULL,lastname varchar(20) not NULL,
age int,city varchar(20),Email varchar(40));
describe persons;