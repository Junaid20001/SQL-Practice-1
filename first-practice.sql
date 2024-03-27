--create database
CREATE DATABASE junni786;

-- Use the junni786 database
use junni786;




-- Create a table named students
create table student(
  stdId int primary key,
  stdName varchar(50),
  age int not null
);

ALTER TABLE student
ADD subject varchar(255);

-- Insert data into the students table
insert into student values(753, 'Jd', 23);
insert into student values(934, 'Fz', 27);
insert into student values(912,'Raza',9);

select * from student;
 





insert into student
values(8765, 'Fateh', 14);

insert into student(stdId, stdName, age, subject)
values(2235, 'Razia', 23, 'GK')

select * from student;


select max(stdId) from student;

select stdId, stdName as [full name], age as dob
from student;