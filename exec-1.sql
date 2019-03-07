# 1. 查找部门 30 中员工的详细信息
  select * from scott.emp where DEPTNO =30;
# 2. 找出从事 clerk 工作的员工的编号、姓名、部门号
  select EMPNO,ENAME,DEPTNO from scott.emp where JOB = clerk;
# 3. 检索出奖金多于基本工资的员工信息
  select * from scott.emp where COMM > SAL;
# 4. 检索出奖金多于基本工资 30% 员工信息
  select * from scott.emp where COMM =1.3 * emp.SAL;
# 5. 希望看到 10 部门的经理或者 20 部门的职员 clerk 的信息
  select * from emp where (JOB ='manager' and DEPTNO = 10) or(JOB = 'clerk' and DEPTNO =20);
# 6. 找出 10 部门的经理、20 部门的职员或者既不是经理也不是职员但是高于 2000 元的员工信息
  select * from emp where(JOB !='manager' or JOB != 'clerk') and SAL >=2000;
# 7. 找出获得奖金的员工的工作
  select Job from emp where COMM > 0;
# 8. 找出奖金少于 100 或者没有获得奖金的员工的信息
  select * from emp where COMM < 100;
# 9. 查找员工雇佣日期是当月的最后一天的员工信息
  select * from emp AS emp WHERE date_add(emp.date, interval 1 day)=1;
# 10. 检索出雇佣年限超过 35 年的员工信息
  select * from emp AS emp WHERE date_add(emp.date, interval -35 year)=1;
# 11. 找出姓名以 A、B、S 开始的员工信息
  select * from scott.emp where ENAME = 'A%' and 'B%' and 'S%';
# 12. 找到名字长度为 4 个字符的员工信息
  select * from scott.emp where ENAME.length = 4;
# 13. 名字中不包含 R 字符的员工信息
  select * from scott.emp where ENAME not like '%S%';
# 14. 找出员工名字的前3个字符
  select substr(ENAME, 1, 3) from emp;
# 15. 将名字中 A 改为 a
  select replace(ENAME,'s','S') from emp;
# 16. 将员工的雇佣日期拖后 10 年
  select hiredate,add_months(hiredate,120) from emp;
# 17. 返回员工的详细信息并按姓名排序
  select * from emp order by ENAME;
# 18. 返回员工的信息并按员工的工作年限降序排列
  select * from emp order by sysdate-HIREDATE desc;
# 19. 返回员工的信息并按工作降序、工资升序排列
  select * from emp order by JOB desc,SAL asc;
# 20. 返回员工的姓名、雇佣年份和月份，并按月份和雇佣日期排序
  select ename,to_char(hiredate,'yyyy') as nian,to_char(hiredate,'mm') as yue from emp order by yue,hiredate;
# 21. 计算员工的日薪，每月按 30 天
  select (nvl(comm,0)+sal)/30 from emp;
# 22. 找出 2 月份雇佣的员工
  select * from emp where to_char(hiredate,'mm')=2;
# 23. 至今为止，员工被雇佣的天数
  select trunc(sysdate-hiredate) from emp;
# 24. 找出姓名中包含 A 的员工信息
  select * from emp where ENAME like '%A%';
# 25. 计算出员工被雇佣了多少年、多少月、多少日
  select trunc(months_between(sysdate,HIREDATE)/12) from emp;
  select trunc((months_between(sysdate,hiredate))-trunc(months_between(sysdate,hiredate)/12)*12) from emp;
  select trunc((sysdate-hiredate)-trunc(months_between(sysdate,hiredate)/12)*365-trunc((months_between(sysdate,hiredate))-trunc(months_between(sysdate,hiredate)/12)*12)*30) from emp;