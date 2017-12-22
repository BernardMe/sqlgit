-- oracle中的字符函数

-- 对字母的大小写进行处理
-- [1] upper: 字母全部大写
-- [2] lower: 字母全部小写
-- [3] initcap: 字母首字母大写

--查询所有员工的姓名，并分别以小写，大写，和首字母大写的形式进行显示
SELECT ename, LOWER(ename), UPPER(ename), INITCAP(ename) FROM emp;

-- 在oracle中,提供了一张虚拟表格,专门用于测试使用, 叫dual
SELECT LOWER('Hello Oracle123'), INITCAP('hello oracle') FROM dual;

--replace： 实现替换功能
--查询所有员工的姓名，将姓名的'A'替换为'a'
SELECT ename, REPLACE(ename,'A','a') FROM emp;

--instr: 查找字串的位置(索引)
--索引位置的起始值为1
SELECT INSTR('abcdefg','g') FROM dual;

--substr:用于字符串的截取
-- 查询所有员工的姓名，并显示姓名的前3个字母
-- 第一个参数表示被截取的字符串
-- 第二个参数表示截取的起始位置，可以是1，也可以是0；可以是负数，表示倒着截取
-- 第三个参数表示截取子串的长度，可以省略，省略表示一直截取到末尾
SELECT ename,substr(ename, 0, 3) FROM emp;

--查询所有员工的姓名，并显示姓名的后3个字母
SELECT ename, SUBSTR(ename, LENGTH(ename)-2, 3) FROM emp;
SELECT ename, SUBSTR(ename, LENGTH(ename)-2) FROM emp;
SELECT ename, SUBSTR(ename, -3) FROM emp;

--concat:表示字符串的连接，功能与||一致
SELECT CONCAT('hello', 'Oracle') FROM dual;
SELECT 'hello'||'Oracle' FROM dual;

--translate:按字符进行翻译
SELECT TRANSLATE('adfggbd','abcdefg','1234567') FROM dual;

