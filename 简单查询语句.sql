


-- 简单的单表查询语句


--查询所有员工信息
SELECT * FROM emp;

--查询部门信息
SELECT * FROM dept;

--查询所有员工的编号
SELECT empno FROM emp;

--查询所有员工的姓名，职位，薪水
SELECT ename, job, sal FROM emp;

--可以给字段起别名
SELECT ename "员工名", job, sal FROM emp;

--AS 可以省略，一般都省略

--别名中一般不要使用特殊字符（包括空格）

--如果必须有特殊字符，可以在别名外包裹双引号

--||表示字符串的拼接

--查询所有员工的姓名职位和薪水
-- 在oracle中,用单引号来表示字符串
SELECT '姓名:' || ename || ', 职位:' || job || ', 薪水:' || sal FROM emp;
SELECT ename||','||job||','||sal describ FROM emp;

--Distinct用于去除重复行，Distinct的作用范围是后面所有字段的组合
--查询所有的职位信息
SELECT job FROM emp;

SELECT DISTINCT job FROM emp;

--order by 用于指定排序的字段及排序规则

-- 查询所有员工的信息,并且以薪水的升序进行排序
SELECT * FROM emp ORDER BY sal;
SELECT * FROM emp ORDER BY sal ASC;

-- 查询员工的姓名和年薪, 按照年薪进行排序
SELECT ename, sal*12 yrSal FROM emp ORDER BY yrSal ASC;


