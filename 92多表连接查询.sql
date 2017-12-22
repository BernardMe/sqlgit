--SQL92 
--多表连接查询


--笛卡儿积
--消除笛卡儿积
--指定两张表的关联条件去除无意义的数据
select * FROM emp, dept WHERE emp.deptno=dept.deptno;

--别名

--查询所有员工的姓名，职位及部门名称
--同名列在查询时必须制定是哪张表的列
SELECT ename, job, dname FROM emp e, dept d WHERE e.deptno=d.deptno;

--非等值连接
--查询20部门员工姓名，入职日期，薪水和薪水等级
SELECT *
FROM emp e, salgrade s
WHERE e.sal BETWEEN s.losal AND s.hisal--关联条件
AND e.deptno=20;--过滤条件

--自联结  将一个表当两个表使用
--查询所有员工的编号，姓名以及领导的编号和姓名
SELECT e1.empno, e1.ename, e1.mgr, e2.ename 
FROM emp e1, emp e2
WHERE e1.mgr=e2.empno
ORDER BY e1.empno;


--外连接
--左外连接   左外连接显示左边表的全部行
--右外连接   右外连接显示右边表的全部行
--查询出某张表，除了满足条件的信息外，还有不满足条件的信息

--查询所有员工的编号，姓名以及领导的编号和姓名，包含没有领导的员工的信息
SELECT e1.empno, e1.ename, e1.mgr, e2.ename 
FROM emp e1, emp e2
WHERE e1.mgr=e2.empno(+);--左外连接

SELECT e2.empno, e2.ename, e2.mgr, e1.ename 
FROM emp e1, emp e2 --e1领导表 e2员工表
WHERE e1.empno(+)=e2.mgr;--右外连接

--部门信息，部门的平均薪水
SELECT d.deptno, nvl(AVG(e.sal), 0)
FROM emp e,dept d
WHERE e.deptno(+)=d.deptno--右外连接
GROUP BY d.deptno
ORDER BY d.deptno;


