create database practice_four;

USE practice_four;

create table Employee_Tbl
(
EmpId int unique not null,
Emp_Name varchar(50),
Emp_Email varchar(50),
Designation varchar(50)
);
insert into Employee_Tbl values(11, 'Saif', 'saifalikhan76@gmail.com', 'CEO');
insert into Employee_Tbl values(22, 'Kaif', 'muhammadkaif88@gmail.com', 'COO');
insert into Employee_Tbl values(33, 'Imran', 'imrankhan66@gmail.com', 'MD');
insert into Employee_Tbl values(44, 'Waseem', 'waseemakram79@gmail.com', 'GM');
insert into Employee_Tbl values(45, 'Naseem', 'NaseemShah97@gmail.com', 'Watchman');

select * from Employee_Tbl;

create table Department_Tbl
(
DeptId int unique not null,
Dept_Name varchar(50) not null,
Dept_Salary nvarchar(50),
EmpId int unique not null,
);
insert into Department_Tbl values(3201, 'Admin', 257000, 22);
insert into Department_Tbl values(4512, 'Manufacturing', 210000, 11);
insert into Department_Tbl values(9007, 'Sales & Marketing', 170000, 44);
insert into Department_Tbl values(1472, 'Production', 194000, 33);

select * from Department_Tbl;

--use for both full table to to join
select * from Employee_Tbl as A
inner join Department_Tbl as B
on  A.EmpId = B.EmpId;

--use for specific column of table's to join
select A.Emp_Name, A.Designation, B.Dept_Name, B.Dept_Salary from Employee_Tbl as A
inner join Department_Tbl as B    --as represent alias
on  A.EmpId = B.EmpId;


--use for left(full data) and same column of table's data in both & ignore extra data of right to join
select A.Emp_Name, A.Designation, B.Dept_Name, B.Dept_Salary from Employee_Tbl as A
left join Department_Tbl as B    --as represent alias
on  A.EmpId = B.EmpId;


--use for right(full data) and same column of table's data in both & ignore extra data of left to join
select A.Emp_Name, A.Designation, B.Dept_Name, B.Dept_Salary from Employee_Tbl as A
right join Department_Tbl as B    --as represent alias
on  A.EmpId = B.EmpId;

--use for right & left(full data including extra(extra means which is not present in other table) data print)same column of table's data to join
select A.Emp_Name, A.Designation, B.Dept_Name, B.Dept_Salary from Employee_Tbl as A
full outer join Department_Tbl as B    --as represent alias
on  A.EmpId = B.EmpId;


drop table Department_Tbl;


--self join
create table Employee_Table
(
Emp_Id int primary key,
Employee_Name varchar(50) not null,
Manager_Id int not null,
);
insert into Employee_Table values(11, 'Amir',  44);
insert into Employee_Table values(22, 'Anus', 33);
insert into Employee_Table values(33, 'Khan', 22);
insert into Employee_Table values(44, 'Nasir',  33);

select * from Employee_Table;

select A.Employee_Name as Employee, B.Employee_Name as Manager
from Employee_Table as A
inner join Employee_Table as B
on A.Manager_Id = B.Emp_Id;


drop table Employee_Table;