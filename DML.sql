--DML
--会破坏原有数据
--复制表
CREATE TABLE temp AS(SELECT * FROM emp);
--复制表结构
create table temp2 AS(SELECT * FROM emp where 1=2);

select * from temp2;

--插入一条记录
INSERT into temp2(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES (1234,'张无忌','教主',7369,SYSDATE,5000,NULL,10);

INSERT INTO temp2 VALUES(1234,'张无忌','教主',7369,SYSDATE,5000,NULL,10);

--插入一条记录(未指明字段值为null)
INSERT INTO temp2 (empno,ename,job)
VALUES(1234,'张无忌','教主');

--可以将查询结果插入一张表中
INSERT INTO temp2 SELECT * FROM emp;


--将10部门员工的工资上升20%
SELECT * FROM temp2;
UPDATE temp2 SET sal=sal*1.2 WHERE deptno=10;

--将10部门员工的工资增长一倍
UPDATE temp2 SET sal=sal*2 WHERE deptno=10;

--删除操作
DELETE FROM temp2 WHERE empno=1234;

DELETE temp2;

-- 清空表中数据
TRUNCATE TABLE temp2;





