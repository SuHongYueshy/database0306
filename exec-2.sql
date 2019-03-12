# 1. 返回拥有员工的部门名、部门号
select scott.dept.DNAME, scott.dept.DEPTNO
from dept
where DEPTNO in (select DEPTNO from emp group by emp.DEPTNO having count(EMPNO) > 0);

# 2. 工资多于 scott 的员工信息
select *
from emp
where sal > (select sal from emp where ENAME = 'scott');

# 3. 返回员工和所属经理的姓名?
select a.ename zhiyuan, b.ename manager
from emp a,
     emp b
where a.mgr = b.empno;

# 4. 返回雇员的雇佣日期早于其经理雇佣日期的员工及其经理姓名
select a.ename zhiyuan, b.ename manager
from emp a,
     emp b
where a.mgr = b.empno
  and a.hiredate < b.hiredate;

# 5. 返回员工姓名及其所在的部门名称
select ENAME, DNAME
from emp e,
     dept d
where d.DEPTNO = e.DEPTNO;

# 6. 返回从事 clerk 工作的员工姓名和所在部门名称
select ENAME, DNAME
from emp e,
     dept d
where e.DEPTNO = d.DEPTNO
  and job = 'clerk';

# 7. 返回部门号及其本部门的最低工资
select DEPTNO, min(SAL)
from emp
group by DEPTNO;

select a.deptno, sal b
from emp a
where sal <= (select min(sal) from emp where deptno = a.deptno);

# 8. 返回销售部 sales 所有员工的姓名
select ENAME
from emp
where DEPTNO = (select DEPTNO from dept where DNAME = 'sales');

# 9. 返回工资多于平均工资的员工
select *
from emp
where sal > (select avg(sal) from emp);

# 10. 返回与 scott 从事相同工作的员工
select *
from emp
where job = (select JOB from emp where ENAME = 'scott');

# 11. 返回比 30 部门员工平均工资高的员工姓名与工资
select ENAME, SAL
from emp
where sal in (select SAL from emp where DEPTNO = 30);

# 12. 返回工资高于30部门所有员工工资的员工信息
select *
from emp
where SAL > all (select SAL from emp where DEPTNO = 30)
  and DEPTNO in (10, 20);

# 13. 返回部门号、部门名、部门所在位置及其每个部门的员工总数
select d.*,count(*) from dept d,emp
     e where d.deptno=e.deptno
group by d.deptno,dname,loc;

# 14. 返回员工的姓名、所在部门名及其工资
select ename, dname, sal
from emp e,
     dept d
where e.deptno = d.deptno;

# 15. 返回雇员表中不在同一部门但是从事相同工作的员工信息

# 16. 返回员工的详细信息，包括部门名
select *
from emp e,
     dept d
where e.deptno = d.deptno;

# 17. 返回员工工作及其从事此工作的最低工资
select job, min(sal)
from emp
group by job;

# 18. 返回不同部门经理的最低工资
select DEPTNO, min(SAL)
from emp
where job = 'MANAGER'
group by DEPTNO;

# 19. 计算出员工的年薪，并且以年薪排序
select EMPNO, ENAME, (SAL + nullif(comm, 0)) * 12 年薪
from emp
order by 年薪;

# 20. 返回工资处于第 4 级别的员工的姓名
select ename
from emp
where sal between (select losal from salgrade where grade = 4) and (select hisal from salgrade where grade = 4);


