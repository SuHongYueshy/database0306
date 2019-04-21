drop database if exists 学生管理系统;
create database 学生管理系统;

drop table if exists 学生管理系统.groups;
create table 学生管理系统.groups(
  ID int auto_increment primary key not null ,
  Name varchar(50) not null ,
  CreateData date
  );

drop table if exists 学生管理系统.students;
create table 学生管理系统.students(
  ID int auto_increment primary key not null ,
  GroupID int,
  Name varchar(50) not null,
  Gender int ,
  Age int ,
  CreateDate date
);

update students.Age set Age = Age + 1;

delete * from 学生管理系统.students where name = '张三';

select Name,Gender,Age from 学生管理系统.students where name like '%张%';

select Name,GroupID,Age from 学生管理系统.students where Age <= 22 and Age >=20;

select Name,GroupID,Age from 学生管理系统.students where GroupID= (select id from 学生管理系统.groups where `groups`.Name = '软件一班') and Gender = 1;

select count(*) from 学生管理系统.students group by GroupID;


