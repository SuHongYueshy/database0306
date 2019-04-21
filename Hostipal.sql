create database 自动售药机;

create table 自动售药机.buy(
  Mdeicum varchar(255) not null,
  price double not null ,
  symptom varchar(255) not null
);

create table 自动售药机.message(
  CardID varchar(255) primary key not null ,
  name varchar(255),
  age int,
  gender varchar(255),
  symptom varchar(255),
  address varchar(255)
);

create table 自动售药机.record(
  Buytime varchar(255),
  medicumName varchar(255),
  num int,
  countPrice double
);

select count(Mdeicum) from 自动售药机.buy ;