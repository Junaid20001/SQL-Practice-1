create database first_practice;

use first_practice;

create table Student_Data(StdId int, StdName varchar(50), FName varchar(50), Roll_No int, Class varchar(50));

select * from Student_Data;

insert into Student_Data values(4005, 'Junaid', 'Khalid', 4005, 'BSCS 3rd Year');
insert into Student_Data values(4006, 'Ahmed', 'Hashmi', 4006, 'BSCS 4rd Year');
insert into Student_Data values(4007, 'Ahub', 'Hashmi', 4007, 'BSCS 4rd Year');
insert into Student_Data values(4008, 'Samveel', 'Ibraheem', 4008, 'BSCS 4rd Year');
insert into Student_Data values(4009, 'Burhan', 'Wani', 4009, 'BSCS 4rd Year');
insert into Student_Data(StdName, FName) values('Tahir', 'Yaqoob');

update Student_Data set Roll_No = 123 where StdName = 'Tahir'; 

update Student_Data set StdName = 'Mohammad Tahir' where Roll_No = 123; 
update Student_Data set StdName = 'Junaid Khalid' where Roll_No = 4005; 

delete from Student_Data where Roll_No = 123; 




