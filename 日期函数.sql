-- 日期函数

--如何获得当前系统时间？
SELECT SYSDATE FROM dual;

--日期之间可以执行减法运算，得到一个数字
--日期和数字可以执行加减法运算，得到一个新的日期
SELECT SYSDATE+10 FROM dual;

--计算所有员工入职年数--不精确
SELECT ename, TRUNC((SYSDATE-hiredate)/365) years FROM emp;

--months_between
SELECT ename, TRUNC(months_between(SYSDATE,hiredate)) mons 
FROM emp;

--add_months
SELECT SYSDATE, add_months(SYSDATE, 5) mon FROM dual;
SELECT SYSDATE, add_months(SYSDATE, -10) mon FROM dual;

--next_day
SELECT SYSDATE, next_day(SYSDATE, '星期一') d FROM dual;

--last_day
SELECT SYSDATE, last_day('1-2月-2017') d FROM dual;

SELECT ROUND(to_date('1-7月-2017'), 'year') FROM dual;
SELECT ROUND(to_date('16-7月-2017'), 'month') FROM dual;
SELECT round(to_date('6-7月-2017'), 'day') FROM dual;

SELECT to_date('17-07-2017', 'dd-MM-yyyy') FROM dual;

SELECT ename, hiredate FROM emp WHERE hiredate>to_date('1982-07-04', 'yyyy-mm-dd HH:Mi:SS');

