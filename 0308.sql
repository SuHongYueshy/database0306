# noinspection SqlWithoutWhereForFile

select *
from db_school.student;



delete
from db_school.student;

show full columns from db_school.student; # 列出表的列信息

show full tables from db_school;

show variables like 'c%'; # 第一个字符是C的

select *
from scott.emp;


select EMPNO,
       HIREDATE -- 投影
from scott.emp;

select distinct JOB
from scott.emp;

select *
from scott.emp
     # where SAL > 2000;
     # where SAL <> 3000;
     # where SAL <> 3000 and JOB <> 'salesman';
where SAL <> 3000
   or JOB <> 'salesman';

-- ci: case insensitive
select *
from scott.emp
where ENAME = binary 'Scott';

select JOB, ENAME, HIREDATE
from scott.emp
     # order by ENAME asc; -- ascend default
     # order by ENAME desc; -- descend
     # order by ENAME;
     # order by HIREDATE; -- 工龄长的在前？后？
order by JOb, ENAME desc;


select comm
from scott.emp
order by COMM;

select *
from sctt.emp
limit 3 offset 0;
-- offset 偏移量（显示3个，每次移几个）
# limit 0, 3; [显示，偏移量]

select ENAME
from scott.emp
     # where ENAME like '_COTT';
where ENAME like '%\_%' escape '\\'; # 带有下划线的名字

update scott.emp
set ENAME = 'scott'
where ENAME = 'sco_tt'; # 将名字改为

select *
from scott.emp;

select *
from scott.dept;

select *
from scott.emp
     # where JOB = 'salesman' or JOB = 'manager' or JOB = 'president';
where job in ('salesman', 'manager', 'president'); # 三者有一个符合的就可以选择

select *
from scott.emp
     # where SAL >= 2000 and sal <=3000; -- [2000, 3000]
where SAL between 2000 and 3000;

select e.ename as '员工 姓名'
from scott.emp as e;

select *
from scott.emp
where comm is not null;

update scott.emp
set comm = null
where EMPNO = '7499';-- DML

select ENAME, sal + ifnull(comm, 0)
from scott.emp;

select e.ENAME, e.DEPTNO, d.Dname, d.DEPTNO
from scott.emp e
            inner join scott.dept d on e.deptno = d.DEPTNO; # kingr的deptno为空，所以没有

select e.*, d.*
from scott.dept d
            inner join scott.emp e;  -- 54=13*4

select e.ENAME, d.DNAME
from scott.emp e
            left join scott.dept d
        on e.DEPTNO = d.DEPTNO;

select e.ENAME, d.DNAME
from scott.dept d
            right join scott.emp e
                       on e.DEPTNO = d.DEPTNO -- KING  右外连接，以右表为基础，显示不匹配的内容

union -- all  将两个表的结果连接起来

select e.ENAME, d.DNAME
from scott.emp e
            right join scott.dept d
                       on e.DEPTNO = d.DEPTNO; -- OPERATIONS  左外连接，以左表为基础，显示不匹配的内容

select e.ENAME, e.DEPTNO, d.DNAME, d.DEPTNO
from scott.emp e
            join scott.dept d
       #                  on e.DEPTNO = d.DEPTNO;
                 using (deptno);
