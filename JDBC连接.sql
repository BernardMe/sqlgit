
--JDBC连接

SELECT * FROM t_user;


--创建 unmber表

CREATE TABLE tnumber (
    nno VARCHAR2(36),
    nnumber NUMBER(7),
    ntype VARCHAR2(10),
    
    CONSTRAINT pk_tnumber_nid PRIMARY KEY (nno)
);
--清空表数据
TRUNCATE TABLE tnumber;


--添加非空约束
ALTER TABLE tnumber MODIFY nnumber CONSTRAINT nn_nnumber NOT NULL;



--查询数据
SELECT count(*) FROM tnumber;

SELECT * FROM tnumber WHERE nnumber=1223;

--统计质数的个数
SELECT ntype, COUNT(*) FROM tnumber GROUP BY ntype;


DELETE tnumber WHERE nno='0965e321125e489a8e129093e0a28c8e';

--统计各部门信息及员工人数和平均工资
SELECT d.*, COUNT(*) empNum, AVG(sal) avgSal
FROM dept d, emp e
WHERE d.deptno=e.deptno
GROUP BY d.deptno, d.dname, d.loc
ORDER BY d.deptno;


--SQL注入漏洞
SELECT count(*) FROM t_user WHERE uname='Wang' or 1=1 --' AND password='2432sd'fsdfs'



