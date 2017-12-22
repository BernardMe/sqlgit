

--SQL99和SQL92对比

--92emp表和dept表做笛卡尔乘积
SELECT * FROM emp, dept;

--99emp表和dept表连接做笛卡尔乘积
SELECT * FROM emp cross JOIN dept;

--SQL92等值连接
SELECT * FROM emp, dept WHERE emp.deptno=dept.deptno;

--SQL99等值连接（连接条件写在ON子句中，where子句中只放过滤条件）
SELECT * FROM emp JOIN dept ON (emp.deptno=dept.deptno);

--SQL99 非等值连接
SELECT ename, empno, grade
FROM emp e JOIN salgrade s ON (e.sal BETWEEN s.losal AND s.hisal);

--SQL99三表连接
SELECT ename, empno, grade 
FROM emp e JOIN dept d ON (e.deptno=d.deptno)
JOIN salgrade s ON (e.sal BETWE EN s.losal AND s.hisal)
WHERE ename NOT LIKE '_A%';

--SQL99自连接
SELECT a.ename, b.ename
FROM emp a JOIN emp b ON a.mgr=b.empno;

--SQL99左外连接
--(会把左边那张表的多余的数据(不能和另外表连接的数据)也拿出来)
SELECT a.ename, b.ename
FROM emp a LEFT JOIN emp b ON a.mgr=b.empno;

SELECT * FROM dept; 

--SQL99右外连接
SELECT a.ename, b.deptno, b.dname
FROM emp a RIGHT JOIN dept b ON (a.deptno=b.deptno);

--SQL99全外连接
SELECT e.ename, d.dname
FROM emp e FULL JOIN dept d ON (e.deptno=d.deptno);
