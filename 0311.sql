create table scott.new_emp
select * from scott.emp;

select *
from scott.new_emp;

delete from scott.new_emp;

insert into scott.new_emp
(EMPNO,ENAME,DEPTNO)
select EMPNO,ENAME,DEPTNO
from scott.emp;

create or replace view scott.v_emp
as
select ename, JOB, DEPTNO
from scott.emp
where deptno = 30;

select *
from scott.v_emp;

select ENAME,DNAME
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO = d.DEPTNO
where ENAME = 'allen';

create or replace view scott.v_name
as
select e.EMPNO, e.ENAME, d.DNAME
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO = d.DEPTNO;

select *
from scott.v_name
where ENAME = 'allen';

select sal
from scott.emp
where ENAME = 'scott';

select *
from scott.emp
where sal > (select sal from scott.emp where ENAME = 'scott');  -- sub query 子查询

start transaction ;  -- DML  insert update delete均会存在于这个事务中

delete
from scott.emp
where ENAME = 'jones';  -- 这样就恢复不了了

savepoint a;

update scott.emp
set sal = 2000
where ENAME = 'martin';

savepoint b;

delete from scott.emp;

select *
from scott.emp;

rollback to b;  -- 回到该保留点之前的位置   结束不了事务
rollback to a;  -- 若直接回滚到第一个保留点，则后面的保留点执行有错，因为第一个保留点时，后面的保留点不存在

rollback ;   -- 回滚，恢复之前删掉的东西   显示结束方式
commit ;     -- 提交，  显式和隐式结束方式

create table scott.test(
  id int
);

select deptno, avg (sal)   -- 平均值
# select sum (sal)   --总和
# select min (SAL), max (SAL)   -- 最大最小值
# select count(SAL)    -- 个数
# select sum(ENAME)
from scott.emp
group by DEPTNO;   -- 分组查询

select job, max(HIREDATE)
from scott.emp
group by JOB
having JOB in ('clerk','manager');   -- 组检索 / where 行检索 / 投影 列检索

select abs(-1);  -- 绝对值

select bin(6);   -- 返回二进制

select pi();     -- π

select rtrim('    test    ');
select ltrim('    test    ');
select trim('     test    ');

select lower(ename)
from scott.emp;

update scott.emp
set ENAME = lower('');


