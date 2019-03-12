show index from scott.emp;
-- Mysql，Primary key & foreign key为默认索引
create index idx_ename on scott.emp(ENAME);

drop index idx_ename on scott.emp;

show index from db_school.student;

