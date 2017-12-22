
--单行函数(输入只有一行)

SELECT CHR(65) FROM dual;

SELECT ASCII('a') FROM dual;

SELECT ROUND(23.652, 1) FROM dual;

SELECT ROUND(23.652, -1) FROM dual;

SELECT * FROM emp WHERE lower(ename) LIKE '_a%';

SELECT SUBSTR(ename, 2, 3) FROM emp;

SELECT to_char(sal, '$99,999.999') FROM emp;

SELECT hiredate FROM emp;

SELECT to_char(hiredate, 'yyyy-mm-dd HH24:MI:ss') FROM emp;


SELECT ename, sal FROM emp WHERE sal>888.88;

SELECT ename, sal FROM emp WHERE sal>to_number('$1,888.00', '$99,999.99');

--NVL函数(处理空值)
SELECT ename, sal*12+comm FROM emp;--参与算术运算有null值，结果为null

SELECT ename, sal*12+NVL(comm, 0) FROM emp;
