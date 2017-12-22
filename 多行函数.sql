
--Oracle函数分为单行函数和多行函数两大类

-- 多行函数（又称统计函数，分组函数）


-- [1]sum 求和
-- [2]avg 求平均值
-- [3]count 计数
-- [4]max 求最大值
-- [5]min 求最小值

--SQL执行顺序
FROM WHERE GROUP BY HAVING SELECT ORDER BY

--统计
select sum(sal), avg(sal), count(empno) from emp;

-- 多行函数可以操作什么类型的数据?
-- 只能操作数值
select sum(sal) from emp;
select avg(ename) from emp;

-- 所有类型都能操作

select count(ename) from emp;
select max(ename), min(hiredate) from emp

--多行函数针对空值的处理(null): null 不参与多行函数的运算
--查询总提成，平均提出
select sum(comm), avg(comm) from emp;

-- 查询emp表格总共有多少记录
select count(*) from emp;

--多行函数不能和普通字段同时查询
SELECT  deptno, sum(sal), avg(sal), max(sal) from emp where deptno=10 GROUP BY deptno;
select deptno from emp where deptno=10;

SELECT  deptno, sum(sal), avg(sal), max(sal) from emp GROUP by deptno;
--计算所有员工的平均工资
SELECT  avg(sal), max(sal) from emp ;

SELECT  deptno from emp where deptno=10 GROUP BY deptno;

-- 分组查询：group by
-- 统计每个部门的总工资

--统计每个部门的总工资，总人数，平均工资 排除 部门10
-- **where 子句要写在 group by之前  先过滤再分组
select deptno, sum(sal), count(*), avg(sal) from emp where deptno<>10 group by deptno order by deptno;

--统计 每个部门的总工资，排除平均工资小于2000的部门
-- **where在分组前进行过滤  having在分组后进行限制
-- [**在where子句中不能使用分组函数]
-- **having 中不能使用别名(执行顺序 from where groupby having select orderby)
select deptno, sum(sal), avg(sal) from emp group by deptno having avg(sal)<2000 order by deptno;

--在emp表中，列出工资最小值小于2000的职位。
select job, min(sal) from emp group by job having min(sal) <2000;

--列出平均工资大于1200元的部门和工作搭配组合
select deptno, job, avg(sal) from emp group by deptno, job having avg(sal)>1200;

--统计人数小于4的部门的平均工资
SELECT deptno,count(*),AVG(sal) FROM emp GROUP BY deptno HAVING COUNT(*)<4;

--统计各部门的最高工资，排除最高工资小于3000的部门
select deptno, max(sal) from emp group by deptno having max(sal)>=3000 order by deptno;

SELECT * FROM emp ORDER BY deptno;


--做实验部分
DELETE emp WHERE ename='美利坚' OR ename='JackJones';
UPDATE emp SET sal=950 WHERE ename='SMITH';

SELECT MAX(sal) FROM emp;

SELECT MIN(sal) FROM emp;

SELECT AVG(sal) FROM emp;
--保留2位小数
SELECT to_char(AVG(sal), '99999999.99') FROM emp;
--四舍五入保留2位
SELECT ROUND(AVG(sal), 2) FROM emp;

SELECT sum(sal) FROM emp;
--统计某一字段非空值的个数
SELECT COUNT(comm) FROM emp;
SELECT COUNT(*) FROM emp WHERE deptno=30;

--distinct 单独唯一的
SELECT COUNT(deptno) FROM emp;

SELECT MAX(sal) FROM emp GROUP BY deptno, job;
SELECT deptno, MAX(sal) FROM emp GROUP BY deptno, job;

--求所有员工工资最高的人的姓名(子查询)
SELECT ename, sal
FROM emp 
WHERE sal=(SELECT MAX(sal) FROM emp);

--求分组后，每个部门工资最高的人的姓名(子查询)
SELECT ename, sal, deptno
FROM emp 
WHERE sal IN (SELECT max(sal) FROM emp GROUP BY deptno);

--group by中的易错点
--(试用了group by子句后， select列表中的字段如果不在分组函数中，就必须要出现在group by子句中
--原因：MAX(sal)返回的一定是单个数值，但是拿到该数值工资的人数可能有多个，无法和Max(sal)返回的单一值组成ResultSet)
SELECT deptno, MAX(sal) FROM emp;--报错，不是单组分组函数
SELECT deptno, MAX(sal) FROM emp GROUP BY deptno;


--having子句(对分组进行限制)
SELECT deptno, AVG(sal) FROM emp GROUP BY deptno;

SELECT deptno, AVG(sal) FROM emp GROUP BY deptno having AVG(sal)>2000;


--综合练习

--对薪水>1200的员工，按deptno分组，分组后平均薪水>1500
--查询--->分组内的平均工资，按照工资的倒序进行排序
  SELECT deptno, AVG(sal) avgSal
  FROM emp 
  WHERE sal>1200 
  GROUP BY deptno 
  HAVING AVG(sal)>1500
  ORDER BY avgSal DESC;


SELECT ename, sal FROM emp WHERE sal=(SELECT MAX(sal) FROM emp);


--【1】列出所有员工的年工资，按年薪从低到高排序。
SELECT sal*12 yrSal FROM emp ORDER BY yrSal;

--【2】列出薪金比“SMITH”多的所有员工。
SELECT ename, sal FROM emp WHERE sal>(SELECT sal FROM emp WHERE ename='SMITH');

--【3】列出所有员工的姓名及其直接上级的姓名。
SELECT e.ename, t.ename FROM emp e, emp t WHERE e.mgr=t.empno(+);

--【4】列出受雇日期早于其直接上级的所有员工。
SELECT ename, hiredate
FROM emp e
WHERE hiredate<
      (SELECT t.hiredate
      FROM emp t 
      WHERE e.mgr=t.empno);
--方法二
SELECT e.ename, e.hiredate, t.ename, t.hiredate
FROM emp e, emp t
WHERE e.mgr=t.empno AND e.hiredate<t.hiredate;

--【5】列出部门名称和这些部门的员工信息，包括那些没有员工的部门。
SELECT t.dname, e.*
FROM emp e, dept t
WHERE e.deptno(+)=t.deptno;

--【6】列出所有job为“CLERK”（办事员）的姓名及其部门名称。
SELECT e.ename, e.job, t.dname
FROM emp e, dept t
WHERE e.deptno=t.deptno AND e.job='CLERK';

--方法二(ORA-25155: NATURAL 联接中使用的列不能有限定词)
SELECT e.ename, t.dname
FROM emp e NATURAL JOIN dept t
WHERE e.job='CLERK';

--#【7】列出最低薪金大于1500的各种工作。
SELECT job FROM emp GROUP BY job HAVING min(sal)>1500;

--【8】列出在部门“SALES”（销售部）工作的员工的姓名，假定不知道销售部的部门编号。
SELECT ename 
FROM emp 
WHERE deptno=(SELECT deptno FROM dept WHERE dname='SALES');

--【9】列出薪金高于公司平均薪金的所有员工。
SELECT * FROM emp WHERE sal>(SELECT AVG(sal) FROM emp);

--【10】列出与“SCOTT”从事相同工作的所有员工
SELECT * FROM emp 
WHERE job=(SELECT job FROM emp WHERE ename='SCOTT');

--【11】列出薪金高于在部门30工作的所有员工的薪金的员工姓名和薪金。
SELECT ename, sal FROM emp 
WHERE sal>(SELECT MAX(sal) FROM emp WHERE deptno=30);

--#【12】列出在每个部门工作的员工数量平均工资和平均服务期限。
SELECT deptno, COUNT(ename), AVG(sal), AVG(SYSDATE-hiredate)
FROM emp
GROUP BY deptno;

--【13】列出所有员工的姓名部门名称和工资。
SELECT ename, dname, sal
FROM emp e, dept t 
WHERE e.deptno=t.deptno;

--#【14】列出从事同一种工作但属于不同部门的员工的一种组合。
SELECT DISTINCT e.ename, e.job,e. deptno, t.ename, t.job, t.deptno
FROM emp e, emp t
WHERE e.job=t.job AND e.deptno<>t.deptno AND e.ename<t.ename;--组合去重

--【15】列出所有部门的详细信息和部门人数。
SELECT t.deptno, t.dname, t.loc,  COUNT(ename)
 FROM emp e, dept t WHERE e.deptno(+)=t.deptno
 GROUP BY t.deptno, t.dname, t.loc;


--【16】列出各种工作的最低工资。
SELECT job, MIN(sal) FROM emp GROUP BY job;

--【17】列出各个部门的MANAGER（经理）的最低薪金。
SELECT deptno, MIN(sal) FROM emp WHERE job='MANAGER' 
GROUP BY deptno;

--【18】列出至少有一个员工的所有部门。
SELECT t.*, COUNT(e.empno) 
FROM emp e, dept t 
WHERE e.deptno=t.deptno
GROUP BY t.deptno, t.dname, t.loc 
HAVING COUNT(ename)>0;

--【19】求部门中哪些人薪水最高
select  ename, sal from emp e
 join (select deptno, max(sal) maxsal from emp group by deptno) t
 on e.sal=t.maxsal and e.deptno=t.deptno; 

--【20】查询各部门的平均薪水，然后求平均薪水的等级
--平均薪水
SELECT deptno, avg(sal) FROM emp GROUP BY deptno;

--和salgrade表做连接
SELECT deptno, sal, grade FROM salgrade s
JOIN (SELECT deptno, avg(sal) sal FROM emp GROUP BY deptno) t
ON t.sal>s.losal AND t.sal<s.hisal;

SELECT deptno, avgsal, grade FROM salgrade s
JOIN (SELECT deptno, avg(sal) avgsal FROM emp GROUP BY deptno) t
ON (t.avgsal BETWEEN s.losal AND s.hisal);
