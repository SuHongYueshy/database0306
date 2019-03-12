show index from scott.emp;
-- Mysql，Primary key & foreign key为默认索引
create index idx_ename on scott.emp(ENAME);

drop index idx_ename on scott.emp;

show index from db_school.student;

-- 如果index只有好处 ，没有必要存在这个概念
-- 索引会降低更新和删除的速度
create index ind_password on db_csdn.user(password);
create index ind_password on db_csdn.user(username);
create index ind_email on db_csdn.user(email);
select password, count(password)
from db_csdn.user
group by password
order by 2 desc   -- 按所选的第二列进行排序
limit 10 offset 0;

select *
from scott.emp;

-- 密码可能是生日的数据
select password
from db_csdn.user
where password regexp '^\198[0-9]{1}[0-9]{1,2}[0-9]{1,2}$';