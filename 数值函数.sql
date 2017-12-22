-- oracle中的数值函数

--ceil 向上取整
--floor 向下取整
--round 四舍五入
--trunc 截断

--round和trunc有两个参数，第二个参数表示保留的位数，可以是正数或负数
--ceil和floor只有一个参数


SELECT CEIL(3.0000001) FROM dual;
SELECT FLOOR(2.9999999) FROM dual;
SELECT ROUND(3.455) FROM dual;
SELECT TRUNC(3.999999) FROM dual;

SELECT ROUND(65.547632, -2) FROM dual;
SELECT TRUNC(65.547632, 1) FROM dual;

--ABS 取绝对值
--SIGN 取符号
--MOD 取模，求余数

SELECT ABS(-10) FROM dual;
SELECT SIGN(-10) FROM dual;
SELECT MOD(10, 3) FROM dual;


--POWER 求幂次方
--SQRT 求算术平方根

SELECT power(2, 3) FROM dual;
SELECT SQRT(3) FROM dual;
