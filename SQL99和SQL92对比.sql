

--SQL99��SQL92�Ա�

--92emp���dept�����ѿ����˻�
SELECT * FROM emp, dept;

--99emp���dept���������ѿ����˻�
SELECT * FROM emp cross JOIN dept;

--SQL92��ֵ����
SELECT * FROM emp, dept WHERE emp.deptno=dept.deptno;

--SQL99��ֵ���ӣ���������д��ON�Ӿ��У�where�Ӿ���ֻ�Ź���������
SELECT * FROM emp JOIN dept ON (emp.deptno=dept.deptno);

--SQL99 �ǵ�ֵ����
SELECT ename, empno, grade
FROM emp e JOIN salgrade s ON (e.sal BETWEEN s.losal AND s.hisal);

--SQL99��������
SELECT ename, empno, grade 
FROM emp e JOIN dept d ON (e.deptno=d.deptno)
JOIN salgrade s ON (e.sal BETWE EN s.losal AND s.hisal)
WHERE ename NOT LIKE '_A%';

--SQL99������
SELECT a.ename, b.ename
FROM emp a JOIN emp b ON a.mgr=b.empno;

--SQL99��������
--(���������ű�Ķ��������(���ܺ���������ӵ�����)Ҳ�ó���)
SELECT a.ename, b.ename
FROM emp a LEFT JOIN emp b ON a.mgr=b.empno;

SELECT * FROM dept; 

--SQL99��������
SELECT a.ename, b.deptno, b.dname
FROM emp a RIGHT JOIN dept b ON (a.deptno=b.deptno);

--SQL99ȫ������
SELECT e.ename, d.dname
FROM emp e FULL JOIN dept d ON (e.deptno=d.deptno);
