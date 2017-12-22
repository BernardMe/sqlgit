

--创建序列
create sequence seq_student_sno;


--以序列作为主键插入数据
INSERT INTO student 
VALUES(seq_student_sno.currval,'小刘','男',23,to_date('25-5月-2017'),'JavaEE','116@123.com',202);


SELECT t.*,t.rowid FROM student t;

UPDATE student SET sname='小关' WHERE sno=113;

-- 查询
-- select 序列名.nextval
-- select 序列名.currval
SELECT * FROM student;
--会获取两行
SELECT seq_student_sno.nextval FROM student;

SELECT seq_student_sno.currval FROM student;

--正常  在调用currval的值前，必须先调用nextval的值。
SELECT seq_student_sno.nextval FROM dual;
SELECT seq_student_sno.currval FROM dual;


-- 创建序列指定详细信息
create  sequence seq_student_sno  start with 100 increment by 5 NOCACHE;


-- 删除序列
drop sequence seq_student_sno;

