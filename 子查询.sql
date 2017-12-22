--子查询
SELECT sal FROM emp WHERE ename='CLARK';
SELECT * FROM emp WHERE sal>2450;

--如何查得所有比CLARK工资高的员工信息

--查询工资高于平均工资的员工
SELECT empno,ename,sal 
FROM emp 
WHERE sal>(SELECT AVG(sal) FROM emp);


--单行子查询  单行子查询只返回一行记录
--对单行子查询可使用单行记录比较运算符


--


--多行子查询  多行子查询返回多行记录
--对多行子查询只能使用多行记录比较运算符
--ALL 和子查询返回的所有值比较
--ANY 和子查询返回的任意一个值比较
--IN 等于列表中的任何一个



--查询工资低于"CLERK"的最高工资的雇员

--查询工资比所有"SALESMAN"的最高工资更高的雇员信息
--单行子查询
SELECT empno,ename,sal
FROM emp
WHERE sal>(SELECT MAX(sal) FROM emp WHERE job='SALESMAN')

--多行子查询
SELECT empno,ename,sal
FROM emp
WHERE sal>ALL(SELECT sal FROM emp WHERE job='SALESMAN')


--in关键字  查询各部门中最高工资的人的信息
--(有可能出错 10部门的员工的工资可能等于30部门的员工中工资的最高值)
SELECT ename, sal FROM emp
WHERE sal IN (SELECT MAX(sal) FROM emp GROUP BY deptno);

--子查询  查询各部门中最高工资的人的信息
--(结果准确)
select  ename, sal from emp e
 join (select deptno, max(sal) maxsal from emp group by deptno) t
 on e.sal=t.maxsal and e.deptno=t.deptno; 


--查询各部门的平均薪水，然后求平均薪水的等级
--平均薪水
SELECT deptno, avg(sal) FROM emp GROUP BY deptno;

--和salgrade表做连接
SELECT deptno, sal, grade FROM salgrade s
JOIN (SELECT deptno, avg(sal) sal FROM emp GROUP BY deptno) t
ON t.sal>s.losal AND t.sal<s.hisal;

SELECT deptno, avgsal, grade FROM salgrade s
JOIN (SELECT deptno, avg(sal) avgsal FROM emp GROUP BY deptno) t
ON (t.avgsal BETWEEN s.losal AND s.hisal);

--每个人的薪水等级
SELECT ename, e.deptno, grade FROM emp e, salgrade s 
WHERE e.sal>s.losal AND e.sal<=s.hisal;

--对上面的虚表进行分组求grade平均值
SELECT t.deptno, AVG(t.grade)
FROM (
     SELECT ename, e.deptno, grade FROM emp e, salgrade s 
     WHERE e.sal>s.losal AND e.sal<=s.hisal
     ) t
GROUP BY t.deptno

--雇员中哪些人是经理人
SELECT empno, ename FROM emp 
WHERE empno IN (SELECT DISTINCT mgr FROM emp);

--不用组函数，求薪水最高值
SELECT sal FROM emp
WHERE sal NOT IN (SELECT DISTINCT a.sal FROM emp a JOIN emp b ON a.sal<b.sal);

--#平均薪水最高的部门编号和名称
SELECT deptno, a_sal 
  FROM (SELECT deptno, AVG(sal) a_sal FROM emp GROUP BY deptno)
 WHERE a_sal=
   (SELECT MAX(avgsal)
    FROM (SELECT deptno, AVG(sal) avgsal FROM emp GROUP BY deptno));
    

--嵌套的分组函数 max(AVG(sal))
SELECT deptno, a_sal 
  FROM (SELECT deptno, AVG(sal) a_sal FROM emp GROUP BY deptno)
 WHERE a_sal=
   (SELECT max(AVG(sal)) avgsal FROM emp GROUP BY deptno);
