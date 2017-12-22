-- where 子句
--用于指定查询的条件，过滤/筛选查询内容

--查询10部门员工的信息



--查询薪水大于等于3000的员工的信息
SELECT * FROM emp WHERE sal>=3000;


-- in, 表示在某个集合中存在
SELECT * FROM emp WHERE ename IN ('KING','SMITH');

-- IS NULL : 表示字段值为null
-- 查询所有没有提成的员工的信息
SELECT * FROM emp WHERE comm IS NULL;

-- 查询所有有提成的员工的信息
SELECT * FROM emp WHERE comm IS NOT NULL;-- 对null取反
SELECT * FROM emp WHERE NOT comm IS NULL;-- 对整个条件取反

-- and 比 or 的优先级高
select * from emp where job='SALESMAN' or job='CLERK' and sal>=1280;
select * from emp where (job='SALESMAN' or job='CLERK') and sal>=1280;


