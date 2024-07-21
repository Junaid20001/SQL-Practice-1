create database practice_three;

/*

alter database practice_three modify name = third_practice;  --1st method to change databse name
--or
execute sp_renamedb 'third_practice', 'practice_three';  --2nd method to change databse name 'Best for use'

create table CustomerTable
(
CustomerId int primary key,
CustomerName varchar(50),
CustomerAddress varchar(max),
City varchar(50)
);

insert into CustomerTable values(3451, 'Junaid', 'University of Karachi', 'Karachi');
insert into CustomerTable values(3324, 'Talha', 'University of Lahore', 'Lahore');
insert into CustomerTable values(3782, 'Sohail', 'University of Rawalpindi', 'Rawalpindi');

select * from CustomerTable;

--for table name change
execute sp_rename 'CustomerTable' , 'DataName';

select * from DataName;

--Add new column in existing(old) table
alter table DataName add Country varchar(50);

--Add value in new creating column
update DataName set Country = +92 where CustomerId = 3324; --'+92 use for nvarchar change it when use varchar above'

--change the data type in the table (Column)
alter table DataName alter column Country nvarchar(50) ;

--delete any column from table
alter table DataName drop column Country;

*/

--Alter in SQL Constraint
USE practice_three;


create table elter
(
VoterId bigint not null,
VoterName varchar(50),
VoterAge int,
);

--Not Null
alter table elter alter column VoterName varchar(50) not null;
alter table elter alter column VoterName varchar(50) null;
insert into elter (VoterId, VoterAge) values(4220124322511, 23); --means null at name --run after alter when use not null and error will give at not null

truncate table elter;

--Unique
alter table elter add unique(VoterId);

insert into elter values(422012543617, 'Junaid', 25); 
insert into elter values(422012543657, 'Funaid', 23); 

drop table elter;
select * from elter;

--primary key

create table pri_mry
(
C_Id bigint,
CityName varchar(50),
VoterId int not null,
VoterAge int,
);

insert into pri_mry values(422012543617, 'Junaid',3432, 25); 
insert into pri_mry values(422012543657, 'Funaid',5474, 18);
insert into pri_mry values(422012543357, 'Runaid',9787, 17);
ALTER TABLE elter ADD primary key(VoterId); 

drop table elter;

--foriegn key
create table pri_mry_city
(
C_Id int,
CityName varchar(50),
VoterId int,
);

alter table pri_mry_city add foreign key (VoterId) references pri_mry(VoterId);

select * from pri_mry;
select * from pri_mry_city;

drop table pri_mry;
truncate table pri_mry;
drop table pri_mry_city;

--Check
alter table pri_mry add check(VoterAge >= 18);

insert into pri_mry values (422012543357, 'Runaid',9787, 17);
insert into pri_mry values (422012543357, 'Runaid',9787, 19);

select * from pri_mry;


--Alias
create table aliyas
(
S_Id int,
StdName varchar(50),
StdFthrName varchar(50),
StdClass nvarchar(50),
);

insert into aliyas values(4201, 'Junaid','Khan', '9th'); 
insert into aliyas values(5431, 'Ali','Murad', '15th');
insert into aliyas values(6521, 'Raza','Saif', '16th');
insert into aliyas values(9630, 'Khan','Inspector', '13th');

select S_Id as Student_Id, StdName as Student_Name, StdFthrName as Student_Father_Name from aliyas;
select * from aliyas;

