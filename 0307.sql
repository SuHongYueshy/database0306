show tables from db_school;

drop database if exists db_school;
create database db_school;

drop table if exists db_school.student;
create table db_school.student
(
  id           int auto_increment primary key comment 'id PK',
  -- 字段名 数据类型 [数据范围] [约束] 注释,
  sno          varchar(255) unique comment '学号',
  gender varchar(255) default 'male' comment '性别',
  name         varchar(255) comment '学生姓名',
  age          int(2) comment '年龄',
  height       double(3, 2) not null comment '身高 x.yz 米',
  dob          date comment '出生年月日 Date Of Birth',
  departmentId int comment '院系 id'
) comment '学生表';

alter table db_school.student auto_increment = 10000;

drop table if exists db_school.department;
create table db_school.department
(
  id    int auto_increment primary key comment 'id PK',
  title varchar(255) comment '院系名称',
  tel   varchar(255) comment '电话'
) comment '院系表';

-- 为学生表追加外键约束
alter table db_school.student
  add constraint
    student_fk_departmentId -- 外键别名 表名_fk_列名
    foreign key (departmentId)
      references db_school.department (id);
#       on delete cascade; -- 级联删除
#       on delete set null ; -- 级联置空

select *
from db_school.student;

desc db_school.student; -- desc: describe

insert into db_school.student value (null, '006', 'male', 'Tom', 19, 1.7, '2000-1-1', 1);
insert into db_school.student value (null, '007', null, 'Jerry', 19, 1.7, '2000-1-1', 1);
insert into db_school.student(sno, name, age, height, dob, departmentId) value ('009', 'Tester', 19, 1.7, '2000-1-1', 1);


update db_school.student
set dob = '2000-3-1'
where name = 'tom';

update db_school.student
set gender = 'female', name = 'Jerry'
where id = 10000;

select *
from db_school.department;

select *
from db_school.student;

insert into db_school.department value (null, 'CS', '010-12345678');
insert into db_school.department value (null, 'SS', '010-12345679');
insert into db_school.department value (null, 'EE', '010-12345680');

delete
from db_school.department
where id = 1;

select s.name, d.title
from db_school.student s
       inner join db_school.department d
                  on d.id = s.departmentId;

drop table db_school.department;
drop table db_school.student;

set foreign_key_checks = 0;
set foreign_key_checks = 1;