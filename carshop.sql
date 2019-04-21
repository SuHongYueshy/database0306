show databases ;
drop database if exists carshop;
create database carshop;
create table carshop.user(
  Uname varchar(255),
  company varchar(255),
  phone varchar(255)
);

create table carshop.good(
  num int  ,
                  Gname varchar(255),
                  price double,
                  danwei varchar(255),
                  shuliang int
);




