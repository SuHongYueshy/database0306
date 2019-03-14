-- 订单号 用户id（卖家与买家都有） 商品id 数量 价格 创建时间 付款 付款时间
drop table if exists db_ec.order;
create table db_ec.order
(
  id         int auto_increment primary key comment 'id PK',
  orderId    varchar(255)  not null unique comment '订单号',
  userId     int           not null comment '用户id 外键',
  productId  int           not null comment '商品id 外键',
  num        int           not null comment '数量',
  price      decimal(8, 2) not null comment '价格',
  createTime datetime      not null default now() comment '创建时间',
  pay        bit           not null comment '0-未付款， 1-已付款',
  payTime    datetime comment '付款时间'
) comment '订单表';

-- 追加外键
alter table db_ec.order
  add constraint
    order_fk_userId
    foreign key (userId)
      references db_ec.user (id);

alter table db_ec.order
  add constraint
    order_fk_productId
    foreign key (productId)
      references db_ec.product (id);
