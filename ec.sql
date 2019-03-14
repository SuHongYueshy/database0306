drop database if exists db_ec;
create database db_ec;

-- user table
drop table if exists db_ec.user;
create table db_ec.user(
  id int auto_increment primary key comment 'id PK',
  email varchar(255) not null unique comment 'email 非空 唯一',
  password varchar(255) not null comment 'password NN',
  mobile varchar(255) not null unique comment 'mobil NN 非空'
)comment 'user table';

select *
from db_ec.user;

-- user _info table
drop table if exists db_ec.user_info;
create table db_ec.user_info(
                              id int auto_increment primary key comment 'id PK',
                              avatar varchar(255) comment 'avatar',
                              gender varchar(255) comment 'gender',
                              city varchar(255) comment 'city',
                              userId int comment 'user id'
)comment 'user_info table';

-- product table
drop table if exists db_ec.product;
create table db_ec.product(
  id int auto_increment primary key comment 'id PK',
  title varchar(255) not null comment 'title NN',
  price decimal (8,2) comment 'price NN',
  originalPrice decimal (8,2) comment 'original price',
  -- slidePictures text not null comment 'slide pictures',-- 滑动图片
  -- 商品详情
  categoryId int comment 'category id FK'
) comment 'product table';

-- category table
drop table if exists db_ec.category;
create table db_ec.category(
  id int auto_increment primary key comment 'id PK',
  title varchar(255) not null comment 'title NN',
  picture varchar(255) comment 'category picture',
  categoryId int comment 'parent category id FK'
)comment 'category table';

-- pictures table
drop table if exists db_ec.pictures;
create table db_ec.pictures(
  id int auto_increment primary key comment 'id PK',
  title varchar(255) not null unique comment 'title NN 唯一',
  type int (1) not null comment 'type ：1—slide picture 2-detail picture',
  productId int comment 'product id FK'
)comment 'pictures table';

alter table db_ec.user_info
add constraint
user_info_fk_userId      -- table name _ fk _ foreign key   fk_table name_colmn
foreign key (userId)
references  db_ec.user(id);

alter table db_ec.category
  add constraint
    user_info_fk_categoryId
    foreign key (categoryId)
      references  db_ec.category(id);

alter table db_ec.product
  add constraint
    user_info_fk_categoryId
    foreign key (categoryId)
      references  db_ec.category(id);

alter table db_ec.pictures
  add constraint
    user_info_fk_productId
    foreign key (productId)
      references  db_ec.product(id);

insert into db_ec.user value (null, '346250026@qq.com', '123', '12345678');
insert into db_ec.user value (null, '799270457@qq.com', '234', '87654321');

insert into db_ec.user_info value (null, );


select * from db_ec.user;
select * from db_ec.user_info;
select * from db_ec.product;
select * from db_ec.pictures;
select * from db_ec.category;