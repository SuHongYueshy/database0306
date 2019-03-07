# SQL 语言是命令式语言
# Ctrl + Enter

show databases ;

create database db_school;

show tables from db_school;

create table db_school.student(
#   字段名 数据类型 [数据范围] [约束] 注释
name varchar(20) comment '学生姓名',
age int(2) comment '年龄'
);

select * from db_school.student;

insert into db_school.student value ('Tom',19);

update db_school.student set age = 20;

delete from db_school.student;

drop table db_school.student;

drop database db_school;


create database db_school;

show tables from db_school;

# use db_school;
create table db_school.student
(
  -- 字段名 数据类型 [数据范围] [约束] 注释,
  name varchar(255) comment '学生姓名',
  age  int(2) comment '年龄',
  height double(3,2) comment '身高 x.yz 米',
  dob date comment '出生年月日 Date Of Birth'
)comment '学生表';

show full columns from db_school.student;

select *
from db_school.student;

insert into db_school.student value ('001','Tom', 19, 1.75, '2000-01-23');
insert into db_school.student value ('002','Jerry', 18, 1.65, '2001-01-23');
# insert into db_school.student value ('Tester', 18, null, '2001-01-23');

update db_school.student
set age = 20;

delete
from db_school.student;

drop table db_school.student;

DROP DATABASE db_school;

select 1 /*hello
 mysql*/ + 1;
