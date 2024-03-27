create database second_practice;

use first_practice;
use second_practice;

create table students (StdId int unique not null, EmpName varchar(50) not null, EmpDept varchar(50) not null, Salary varchar(50) not null);

select * from students;
insert into students values(04005, 'Junaid', 'Computer Science', 31000);
insert into students values(04006, 'Khalid', 'Computer Science', 30000);

--primary key
create table Voter_list(VoterId int primary key, voterName varchar(50) not null, voterAge int not null check(voterAge >= 18));
select * from Voter_list;

insert into Voter_list values(753, 'Verma', 53);
insert into Voter_list values(243, 'Akshay', 18);
insert into Voter_list values(43, 'Saif', 19);
insert into Voter_list values(93, 'Saen', 16);

--select spacific(column) id or name
select voterName from Voter_list where VoterId = 43 or VoterId = 93 or VoterId = 243 ;

--select specific(row).
select * from Voter_list where VoterId = 43 or VoterId = 93 or VoterId = 243 ;

--select ascending order in row by help of column
select * from Voter_list order by voterAge asc;

--select desending order in row by help of column
select * from Voter_list order by voterAge desc;


--forign key(By default this action in NO Action Method)
create table CustomerTable
(
CustomerId int primary key,
CustomerName varchar(50) not null,
CustomerAddress varchar(max),
City varchar(50)
);

select * from CustomerTable;

insert into CustomerTable values(3451, 'Junaid', 'University of Karachi', 'Karachi');
insert into CustomerTable values(3324, 'Talha', 'University of Lahore', 'Lahore');
insert into CustomerTable values(3782, 'Sohail', 'University of Rawalpindi', 'Rawalpindi');
insert into CustomerTable values(2561, 'Izhaan', 'University of Peshawar', 'Peshawar');
insert into CustomerTable values(1103, 'Zoroo', 'University of Multan', 'Multan');
insert into CustomerTable values(4451, 'Sheeraz', 'University of Gujrat', 'Gujrat');

create table OrderTable
(
OrderId int primary key,
ItemName varchar(50) not null,
Quantity int,
Price1item int,
CustomerId int foreign key references CustomerTable(CustomerId),
);

insert into OrderTable values(24,'Atta',  2, 1200,3451);
insert into OrderTable values(32, 'Ghee', 3, 390,3324);
insert into OrderTable values(45, 'Suger', 2, 149,3782);
insert into OrderTable values(63, 'White channa', 2, 360,2561);
insert into OrderTable values(27, 'Black Channa', 180, 3,1103);
insert into OrderTable values(33, 'Black Channa', 180, 3,3324);
insert into OrderTable values(97, 'Oil', 5, 380,4451);

select * from CustomerTable;
select * from OrderTable;



truncate table CustomerTable;
truncate table orderTable;

drop TABLE CustomerTable;
drop table orderTable;


--Cascading Referential Integrity
create table CustomersTable
(
CustomersId int primary key,
CustomersName varchar(50) not null,
CustomersAddress varchar(max),
City varchar(50)
);

select * from CustomersTable;

insert into CustomersTable values(3451, 'Junaid', 'University of Karachi', 'Karachi');
insert into CustomersTable values(3324, 'Talha', 'University of Lahore', 'Lahore');
insert into CustomersTable values(3782, 'Sohail', 'University of Rawalpindi', 'Rawalpindi');
insert into CustomersTable values(2561, 'Izhaan', 'University of Peshawar', 'Peshawar');
insert into CustomersTable values(1103, 'Zoroo', 'University of Multan', 'Multan');
insert into CustomersTable values(4451, 'Sheeraz', 'University of Gujrat', 'Gujrat');

create table OrdersTable
(
OrdersId int primary key,
ItemName varchar(50) not null,
Quantity int,
Price1item int,
CustomersId int foreign key references CustomersTable(CustomersId)
on delete cascade --for delete the primary data and automatically apply on foriegn key data
on update cascade --for update the primary data and automatically apply on foriegn key data
);

insert into OrdersTable values(24,'Atta',  2, 1200,3451);
insert into OrdersTable values(32, 'Ghee', 3, 390,3324);
insert into OrdersTable values(45, 'Suger', 2, 149,3782);
insert into OrdersTable values(63, 'White channa', 2, 360,2561);
insert into OrdersTable values(27, 'Black Channa', 180, 3,1103);
insert into OrdersTable values(33, 'Black Channa', 180, 3,3324);
insert into OrdersTable values(97, 'Oil', 5, 380,4451);

delete from CustomersTable where customersId = 1103;  --for delete spacific data in table 
update CustomersTable set CustomersId = 7865 where CustomersId = 3782; --for update spacific data in table 



select * from CustomersTable;
select * from OrdersTable;



truncate table CustomersTable;
truncate table ordersTable;

drop TABLE CustomersTable;
drop table ordersTable;


--SET NULL Integrity Method
create table CstmrTable
(
CustomersId int primary key,
CustomersName varchar(50),
CustomersAddress varchar(max),
City varchar(50)
);

select * from CstmrTable;

insert into CstmrTable values(3451, 'Junaid', 'University of Karachi', 'Karachi');
insert into CstmrTable values(3324, 'Talha', 'University of Lahore', 'Lahore');
insert into CstmrTable values(3782, 'Sohail', 'University of Rawalpindi', 'Rawalpindi');
insert into CstmrTable values(2561, 'Izhaan', 'University of Peshawar', 'Peshawar');
insert into CstmrTable values(1103, 'Zoroo', 'University of Multan', 'Multan');
insert into CstmrTable values(4451, 'Sheeraz', 'University of Gujrat', 'Gujrat');

create table OrdrTable
(
OrdersId int primary key,
ItemName varchar(50),
Quantity int,
Price1item int,
CustomersId int foreign key references CstmrTable(CustomersId)
on delete set null --for delete the data from primary and set null(null) apply(show) on foriegn key data/table
on update set null --for update thedata in primary table but set null(Null) apply(show) on foriegn key data//table
);

insert into OrdrTable values(24,'Atta',  2, 1200,3451);
insert into OrdrTable values(32, 'Ghee', 3, 390,3324);
insert into OrdrTable values(45, 'Suger', 2, 149,3782);
insert into OrdrTable values(63, 'White channa', 2, 360,2561);
insert into OrdrTable values(27, 'Black Channa', 180, 3,1103);
insert into OrdrTable values(33, 'Black Channa', 180, 3,3324);
insert into OrdrTable values(97, 'Oil', 5, 380,4451);

delete from CstmrTable where customersId = 1103;  --for delete spacific data in table 
update CstmrTable set CustomersId = 7865 where CustomersId = 3782; --for update spacific data in table 



select * from CstmrTable;
select * from OrdrTable;



--SET Default
