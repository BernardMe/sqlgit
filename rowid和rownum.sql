

--rowid 和 rownum 伪列
--rowid指向 记录在硬件上的存储位置，效率最高，但非人力所为



--rownum 行号

SELECT t.*, ROWID FROM student t;


--查询所有员工中工资前五名
SELECT t.*, ROWID FROM emp t WHERE ROWNUM<6 ORDER BY sal DESC;

--借助子查询
SELECT a.* FROM (
       SELECT rownum, t.* FROM emp t ORDER BY sal DESC
) a WHERE ROWNUM>=1;


--分页查询  另外还要注意：rownum不能以任何基表的名称作为前缀
SELECT b.* FROM (
    SELECT ROWNUM rn, a.* FROM (
           SELECT t.* FROM emp t ORDER BY sal DESC
    ) a WHERE ROWNUM<=10
) b WHERE rn>5;·

-- 每页显示条数: size
-- 当前要显示第几页: page
SELECT b.* FROM (
    SELECT ROWNUM rn, a.* FROM (
           SELECT t.* FROM emp t ORDER BY sal DESC
    ) a WHERE ROWNUM<=15
) b WHERE rn>10;

--求差集 求rownum：6-15的记录
SELECT ROWNUM rn, a.* FROM (SELECT t.* FROM emp t ORDER BY sal DESC) a WHERE ROWNUM<=15
MINUS 
SELECT ROWNUM rn, a.* FROM (SELECT t.* FROM emp t ORDER BY sal DESC) a WHERE ROWNUM<=5



