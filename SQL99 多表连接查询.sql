--SQL99 
--多表连接查询


--[1]交叉连接：CROSS JOIN 作用实际是SQL92中的笛卡儿积
SELECT * FROM emp, dept;
SELECT * FROM emp CROSS JOIN dept;

--[2]自然连接：NATURAL JOIN 作用就是按照两表所有【同名字段】进行等值连接
-- 在自然链接中，同名字段不能用表（表别名）前缀修饰

SELECT * FROM emp NATURAL JOIN dept;

SELECT * FROM emp, dept WHERE emp.deptno=dept.deptno;

-- 查询30部门所有员工的编号, 姓名, 部门编号和部门名称
SELECT e.empno,e.ename,deptno,d.dname 
FROM emp e NATURAL JOIN dept d WHERE deptno=30;

--[3]USING连接：使用USING建立连接，作用就是指定两表进行等值连接的【同名字段】
-- 注意，同名字段不允许使用表前缀

SELECT e.empno, e.ename FROM emp e JOIN dept d USING(deptno) WHERE deptno=30;


--[4]ON连接：使用ON建立连接，作用是通过ON子句来指定表之间的连接条件
-- 既可以等值连接  也可以非等值连接
--查询20部门员工的姓名，入职日期，薪水和薪水等级
SELECT e.empno,e.ename,e.sal,s.grade 
FROM emp e JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal WHERE deptno=20;

--SQL99实现自连接
--查询所有员工的编号，姓名，以及领导的编号和姓名
SELECT a.empno,a.ename,b.empno,b.ename
FROM emp a --代表员工
JOIN emp b --代表领导
ON a.mgr=b.empno

--(左外连接)查询所有员工的编号，姓名，以及领导的编号和姓名，包含没有领导的员工的信息z
SELECT a.empno,a.ename,b.empno,b.ename
FROM emp a --代表员工
LEFT JOIN emp b --代表领导
ON a.mgr=b.empno

--[5]外连接：
--左外连接 LEFT (OUTER) JOIN
--右外连接 RIGHT (OUTER) JOIN
--全外连接 FULL (OUTER) JOIN
SELECT e.empno,d.deptno,d.dname
FROM emp e 
RIGHT JOIN dept d
ON e.deptno=d.deptno
--WHERE d.deptno=30;



--查询所有部门平均薪水及部门信息(SQL92)
SELECT d.deptno,d.dname,AVG(e.sal)
FROM dept d,emp e
WHERE d.deptno=e.deptno(+)
GROUP BY d.deptno, d.dname
ORDER BY d.deptno;

--(SQL99)
SELECT d.deptno,d.dname,AVG(e.sal)
FROM dept d 
LEFT JOIN emp e ON d.deptno=e.deptno
GROUP BY d.deptno, d.dname
ORDER BY d.deptno;

--更多表的连接查询
--查询20 部门员工的姓名, 部门名称, 薪水及薪水等级
SELECT ename,dname,sal,grade
FROM emp a, dept b, salgrade c
WHERE a.deptno=b.deptno
AND a.sal BETWEEN c.losal AND c.hisal
AND a.deptno=20;

SELECT e.ename, d.dname, e.sal, s.grade
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
JOIN salgrade s
ON e.sal BETWEEN s.losal AND s.hisal
WHERE e.deptno = 20;

SELECT a.ename,b.dname,a.sal,c.grade
FROM emp a
NATURAL JOIN dept b
JOIN salgrade c
ON a.sal BETWEEN c.losal AND c.hisal
WHERE deptno=20;









