show index from scott.emp;
-- Mysql，Primary key & foreign key为默认索引
create index idx_ename on scott.emp(ENAME);

drop index idx_ename on scott.emp;

show index from db_school.student;

-- 如果index只有好处 ，没有必要 存在这个概念
create index ind_password on db_csdn.user(password);
select password, count(password)
from db_csdn.user
group by password
order by 2 desc   -- 按所选的第二列进行排序
limit 10 offset 0;
