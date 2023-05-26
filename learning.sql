drop database learning
create database learning
on primary(
   name = learning,
   filename= 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\learning.mdf',
   size = 5MB,
   filegrowth = 50%,
   maxsize = unlimited
)

log on(
   name = learning_log,
   filename= 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\learning_log1.ldf',
   size = 10MB,
   filegrowth = 5MB,
   maxsize = 100MB
)


create table course(
   id int unique,
   course_name nvarchar(50) unique,
   hours int,
   primary key(id,course_name)
   )
create table question (
 question_id int,
name nvarchar(500),
opt1 nvarchar(500),
opt2 nvarchar(500),
opt3 nvarchar(500),
opt4 nvarchar(500),
answer nvarchar(500)
)

create table lecture(
    course_name nvarchar(50),
	lecture_number int,
	ass_number int ,
	id int ,
	CONSTRAINT lec_id_const FOREIGN KEY(id) REFERENCES course(id) ON DELETE CASCADE ON UPDATE CASCADE 
)


create table login(
   [user_name] nvarchar(100),
   [password] nvarchar(100),
   Utype nvarchar(100)
)
create table registation(
id int primary key,
   firstname nvarchar(100),
   lastname nvarchar(100),
   sex nvarchar(100),
   telephone nvarchar(100),
   address nvarchar(100),
   marks int ,
   cor_name nvarchar(50) ,
   	CONSTRAINT cor_id_const FOREIGN KEY(cor_name) REFERENCES course(course_name)
)

drop table registation
drop table course

select registation.id,registation.firstname,registation.lastname,registation.sex,registation.telephone,registation.address,registation.marks,course.id,course.course_name,hours
from registation
left join course
on course.course_name = cor_name


alter table registation 
add grade  nvarchar (30)

alter table registation 
add gpa int 

update registation set gpa = marks *10
update registation set grade = 'A' where gpa >= 90
update registation set grade = 'B' where gpa >= 80 and gpa <90
update registation set grade = 'C' where gpa >= 70 and gpa <80
update registation set grade = 'D' where gpa >= 60 and gpa <70
update registation set grade = 'E' where gpa >= 50 and gpa <60
update registation set grade = 'F' where gpa < 50 

select registation.id , registation.firstname , registation.lastname , registation.marks , registation.grade , registation.gpa
from registation

