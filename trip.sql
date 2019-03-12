drop database if exists 学生春游报名系统;
create database 学生春游报名系统;

drop table if exists 学生春游报名系统.user;
create table 学生春游报名系统.user(
                            id int auto_increment primary key comment 'id PK',
                            username varchar(255) not null comment 'username NN',
                            password varchar(255) not null comment 'password NN',
                            role int(1) not null default 0 comment 'role 0-student 1-admin NN'
)comment 'user table';

drop table if exists 学生春游报名系统.activity;
create table 学生春游报名系统.activity(
  id int auto_increment primary key comment 'id PK',
  title varchar(255) not null comment 'activity title NN'
)comment 'activity table';

drop table if exists 学生春游报名系统.enroll;
create table 学生春游报名系统.enroll(
  id int auto_increment primary key comment 'id PK',
  time datetime not null default now() comment 'enroll time NN',
  userId int not null comment 'user id FK',
  activityId int not null comment 'activity id FK'
)comment 'enroll table';

alter table 学生春游报名系统.enroll
add constraint
enroll_fk_activityId
foreign key (activityId)
references 学生春游报名系统.activity(id);

alter table 学生春游报名系统.enroll
  add constraint
    enroll_fk_userId
    foreign key (userId)
      references 学生春游报名系统.user(id);

-- add admin
insert into 学生春游报名系统.user value (null, 'admin', md5('123'), 1);

-- admin sign 'xxx' , 'yyy' 管理员登录的过程
select *
from 学生春游报名系统.user
where username = 'admin'
  and password = md5('123');

-- create
insert into 学生春游报名系统.activity value (null, '植物园一日游');
insert into 学生春游报名系统.activity value (null, '动物园一日游');

-- delete
delete
from 学生春游报名系统.activity
where id = 1;

-- update
update 学生春游报名系统.activity
set title = ''
where id = 1;

-- retrieve
select *
from 学生春游报名系统.activity;

-- student sign up
insert into 学生春游报名系统.user(username ,password) value ('Tom', md5('abc'));
insert into 学生春游报名系统.user(username ,password) value ('Jerry', md5('def'));
insert into 学生春游报名系统.user(username ,password) value ('Tester', md5('ghi'));

-- student sign in 'xxx','yyy'
select *
from 学生春游报名系统.user
where username = 'Jerry'
and password = md5('def');

# delete from 学生春游报名系统.user;   -- delete 和truncate 的区别：
# set foreign_key_checks = 0;          -- truncate开启之后，rollback恢复不回来，delete可以回滚
# set foreign_key_checks = 1;          -- delete删除后重新插入序号是接着删除之后来的，而truncate是从1开始
# truncate 学生春游报名系统.user;

-- student enroll
insert into 学生春游报名系统.enroll(id, userId, activityId) value (null, 2, 1);
insert into 学生春游报名系统.enroll(id, userId, activityId) value (null, 3, 2);

-- admin sign in retrieve
select u.username, a.title
from 学生春游报名系统.user u
       inner join 学生春游报名系统.enroll e
                  on u.id = e.userId
       inner join 学生春游报名系统.activity a
                  on e.activity = a.id;

select u.username, a.title
from 学生春游报名系统.user u
       inner join 学生春游报名系统.enroll e
                  on u.id = e.userId
       inner join 学生春游报名系统.activity a
                  on e.activityId = a.id
where a.id = 1;  # where a.id = 2

select *
from 学生春游报名系统.user;
select *
from 学生春游报名系统.activity;
select *
from 学生春游报名系统.enroll;