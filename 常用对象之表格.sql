-- 常用对象之表格

--查询当前用户的所有表格
SELECT * FROM tab;

--创建学生表
CREATE TABLE stu(
       sno NUMBER(3),
       sname VARCHAR2(15),
       gender CHAR(3) DEFAULT '男',
       age NUMBER(2),
       sdate DATE,
       sclass VARCHAR(30),
       email VARCHAR2(30)
)

SELECT * FROM student;

--删除学生表
DROP TABLE stu;

--修改表格

--增加列
ALTER TABLE student ADD(address VARCHAR2(30));
--修改列名
ALTER TABLE student RENAME COLUMN address TO loc;
--修改列的类型
ALTER TABLE student MODIFY(loc CHAR(20));
--删除列
ALTER TABLE student DROP COLUMN loc;

--对表格进行重命名
RENAME student TO stu;


-- 查询回收站
SELECT * FROM RECYCLEBIN;

--从回收站还原表格
FLASHBACK TABLE stu TO BEFORE DROP;

--从回收站彻底删除某张表
PURGE TABLE stu;

--清空回收站
PURGE RECYCLEBIN;

--不通过回收站删除表
DROP TABLE stu PURGE;




