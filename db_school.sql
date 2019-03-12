show databases ;

create database db_school;  /*创建数据库*/

create table db_school.student(
  sno char (10) comment '学号',
  name char (8) comment '姓名',
  gender char(2) comment '性别',
  major char (20) comment '专业',
  birth char (30) comment '出生年月'
);
insert into db_school.student values ( '1850212601', 'Danny', '男', 'Java', '2000年3月');
insert into db_school.student values ( '1850312602', 'Jenny', '男', 'C#','2006年1月');
insert into db_school.student values ( '1850412604', 'LiMing', '女','Python', '1999年8月');

show full columns from db_school.student;
select * from db_school.student;


create table db_school.course(
  number int (20) comment '课程号',
  cn char (20) comment '课程名',
  credit int (3) comment '学分'
)comment '课程表';
insert into db_school.course values (001, 'Java', 5);
insert into db_school.course values (002, 'C#', 3);
insert into db_school.course values (003, 'Python',6);
insert into db_school.course values (004, 'C++', 2);

show full columns from db_school.course;
select * from db_school.course;

drop table db_school.sc;
create table db_school.sc(
 sno char (10) comment '学号',
 number int (20) comment '课程号',
 grade double (3,1) comment '成绩'
) comment '选课表';
insert into db_school.sc values ('1850212601', 001, 98.5);
insert into db_school.sc values ('1850312602', 004, 65.1);
insert into db_school.sc values ('1850412604', 002, 78.8);
insert into db_school.sc values ('1850212601', 002, 98.6);

show full columns from db_school.sc;
select * from db_school.sc;

# select * from sc where sno = '1850212601';





