drop database if exists 图书馆管理系统;
create database 图书馆管理系统;

drop table if exists 图书馆管理系统.student;
create table 图书馆管理系统.student(
                            id int auto_increment primary key comment 'id PK',
                            sname varchar(255) not null comment 'username NN',
                            password varchar(255) not null comment 'password NN',
                            role int(1) not null default 0 comment 'role 0-student 1-admin NN'
)comment 'user table';

drop table if exists 图书馆管理系统.book;
create table 图书馆管理系统.book(
                                id int auto_increment primary key comment 'id PK',
                                title varchar(255) not null comment 'book title NN'
)comment 'activity table';

drop table if exists 图书馆管理系统.register;
create table 图书馆管理系统.register(
                              id int auto_increment primary key comment 'id PK',
                              time datetime not null default now() comment 'register time NN',
                              studentId int not null comment 'student id FK',
                              bookId int not null comment 'book id FK'
)comment 'register table';

alter table 图书馆管理系统.register
  add constraint
    register_fk_bookId
    foreign key (bookId)
      references 图书馆管理系统.book(id);

alter table 图书馆管理系统.register
  add constraint
    register_fk_stduentId
    foreign key (studentId)
      references 图书馆管理系统.student(id);

-- add admin
insert into 图书馆管理系统.student value (null, 'admin', md5('123'), 1);

-- admin sign 'xxx' , 'yyy' 管理员登录的过程
select *
from 图书馆管理系统.student
where sname = 'admin'
  and password = md5('123');

-- create
insert into 图书馆管理系统.book value (null, '假如给我三天光明');
insert into 图书馆管理系统.book value (null, '花田半亩');
insert into 图书馆管理系统.book value (null, '我所理解的生活');

-- delete
delete
from 图书馆管理系统.book
where id = 1;

-- update
update 图书馆管理系统.book
set title = ''
where id = 1;

-- retrieve
select *
from 图书馆管理系统.book;

-- student sign up
insert into 图书馆管理系统.student(sname ,password) value ('Danny', md5('abc'));
insert into 图书馆管理系统.student(sname ,password) value ('Jenny', md5('def'));
insert into 图书馆管理系统.student(sname ,password) value ('LiMing', md5('ghi'));

-- student sign in 'xxx','yyy'
select *
from 图书馆管理系统.student
where sname = 'Jenny'
  and password = md5('def');

# delete from 学生春游报名系统.user;   -- delete 和truncate 的区别：
# set foreign_key_checks = 0;          -- truncate开启之后，rollback恢复不回来，delete可以回滚
# set foreign_key_checks = 1;          -- delete删除后重新插入序号是接着删除之后来的，而truncate是从1开始
# truncate 学生春游报名系统.user;

-- student enroll
insert into 图书馆管理系统.register(id, studentId, bookId) value (null, 2, 1);
insert into 图书馆管理系统.register(id, studentId, bookId) value (null, 3, 2);

-- admin sign in retrieve
select s.sname, b.title
from 图书馆管理系统.student s
       inner join 图书馆管理系统.register r
                  on s.id = r.studentId
       inner join 图书馆管理系统.book b
                  on r.bookId = b.id;

select s.sname, b.title
from 图书馆管理系统.student s
       inner join 图书馆管理系统.register r
                  on s.id = r.studentId
       inner join 图书馆管理系统.book b
                  on r.bookId = b.id
where b.id = 1;  # where a.id = 2

select *
from 图书馆管理系统.student;
select *
from 图书馆管理系统.book;
select *
from 图书馆管理系统.register;