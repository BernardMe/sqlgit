
--# 主键约束

INSERT INTO student 
VALUES(113,'小马','男',23,to_date('25-5月-2017'),'JavaEE','112@123.com',202);
INSERT INTO student 
VALUES(112,'小刘','男',23,to_date('25-5月-2017'),'JavaEE','113@123.com',202);


SELECT * FROM student;




--彻底删除表
DROP TABLE student PURGE;
--创建学生表
CREATE TABLE student(
       --sno NUMBER(3) CONSTRAINT pk_student PRIMARY KEY, --在列级别定义主键约束
       sno NUMBER(3) PRIMARY key,
       sname VARCHAR2(15),
       gender CHAR(3) DEFAULT '男',
       age NUMBER(2),
       sdate DATE,
       sclass VARCHAR(30),
       email VARCHAR2(30)
       
       --在表级别定义主键约束
       --定义主键约束
       --CONSTRAINT pk_student PRIMARY KEY (sno)
       --PRIMARY KEY (sno) --简化版
);

DELETE FROM student WHERE sno=111;


--## 联合主键

--彻底删除表
DROP TABLE student PURGE;
--创建学生表
CREATE TABLE student(
      
       sno NUMBER(3),
       sname VARCHAR2(15),
       gender CHAR(3) DEFAULT '男',
       age NUMBER(2),
       sdate DATE,
       sclass VARCHAR(30),
       email VARCHAR2(30),
       
       --在表级别定义联合主键约束
       --定义联合主键约束  只能在表级别添加
       CONSTRAINT pk_student PRIMARY KEY (sno,sname)
       
);

--# 非空约束

--彻底删除表
DROP TABLE student PURGE;
--创建学生表
CREATE TABLE student(
      
       sno NUMBER(3),
       sname VARCHAR2(15) CONSTRAINT nn_student_sname NOT NULL,--只能在字段级别添加
       gender CHAR(3) DEFAULT '男',
       age NUMBER(2),
       sdate DATE,
       sclass VARCHAR(30),
       email VARCHAR2(30),
       
       --在表级别定义主键约束
       --定义主键约束
       CONSTRAINT pk_student PRIMARY KEY (sno) 
);


--# 唯一约束
--要求该列唯一，允许为空
--邮箱地址使用 唯一约束

--彻底删除表
DROP TABLE student PURGE;
--创建学生表
CREATE TABLE student(
      
       sno NUMBER(3),
       sname VARCHAR2(15) CONSTRAINT nn_student_sname NOT NULL,--只能在字段级别添加
       gender CHAR(3) DEFAULT '男',
       age NUMBER(2),
       sdate DATE,
       sclass VARCHAR(30),
       email VARCHAR2(30),
       
       --在表级别定义主键约束
       --定义主键约束
       CONSTRAINT pk_student PRIMARY KEY (sno),
       -- 表级别 定义 唯一约束
       CONSTRAINT uk_student_email UNIQUE(email)
);


--# 检查约束

--彻底删除表
DROP TABLE student PURGE;
--创建学生表
CREATE TABLE student(
      
       sno NUMBER(3),
       sname VARCHAR2(15) CONSTRAINT nn_student_sname NOT NULL,--只能在字段级别添加
       gender CHAR(3) DEFAULT '男',
       age NUMBER(2),
       sdate DATE,
       sclass VARCHAR(30),
       email VARCHAR2(30),
       
       --在表级别定义主键约束
       --定义主键约束
       CONSTRAINT pk_student PRIMARY KEY (sno),
       -- 表级别 定义 唯一约束
       CONSTRAINT uk_student_email UNIQUE(email),
       --表级别 定义 检查约束
       CONSTRAINT ck_student_age CHECK(age BETWEEN 18 AND 30)
);



--# 外键约束

--彻底删除表
DROP TABLE student PURGE;

--创建班级表
CREATE TABLE clazz(
       cno NUMBER(3),
       cname VARCHAR2(15),
       cdate DATE,
       
       --在表级别定义主键约束
       --定义主键约束
       CONSTRAINT pk_clazz PRIMARY KEY (cno)
);

--插入班级表记录
INSERT INTO clazz
VALUES(202, 'JAVA大牛班',SYSDATE);
INSERT INTO clazz
VALUES(302, 'JAVA小牛班',SYSDATE);
INSERT INTO clazz
VALUES(402, 'Python大牛班',SYSDATE);
INSERT INTO clazz
VALUES(502, 'PHP大牛班',SYSDATE);

--查询班级表
SELECT * FROM clazz;


--创建学生表
CREATE TABLE student(
      
       sno NUMBER(3),
       sname VARCHAR2(15) CONSTRAINT nn_student_sname NOT NULL,--只能在字段级别添加
       gender CHAR(3) DEFAULT '男',
       age NUMBER(2),
       sdate DATE,
       sclass VARCHAR(30),
       email VARCHAR2(30),
       cno NUMBER(3), --REFERENCES clazz(cno) --列级别 定义 外键约束 不写foreign key 
       
       --在表级别定义主键约束
       --定义主键约束
       CONSTRAINT pk_student PRIMARY KEY (sno),
       -- 表级别 定义 唯一约束
       CONSTRAINT uk_student_email UNIQUE(email),
       --表级别 定义 检查约束
       CONSTRAINT ck_student_age CHECK(age BETWEEN 18 AND 30),
       --表级别 定义 外键约束
       CONSTRAINT fk_student_cno FOREIGN KEY(cno) REFERENCES clazz(cno)
);


--# 级联删除

CREATE TABLE student(
      
       sno NUMBER(3),
       sname VARCHAR2(15) CONSTRAINT nn_student_sname NOT NULL,--只能在字段级别添加
       gender CHAR(3) DEFAULT '男',
       age NUMBER(2),
       sdate DATE,
       sclass VARCHAR(30),
       email VARCHAR2(30),
       cno NUMBER(3), --REFERENCES clazz(cno) --列级别 定义 外键约束 不写foreign key 
       
       --在表级别定义主键约束
       --定义主键约束
       CONSTRAINT pk_student PRIMARY KEY (sno),
       -- 表级别 定义 唯一约束
       CONSTRAINT uk_student_email UNIQUE(email),
       --表级别 定义 检查约束
       CONSTRAINT ck_student_age CHECK(age BETWEEN 18 AND 30),
       --表级别 定义 外键约束
       --CONSTRAINT fk_student_cno FOREIGN KEY(cno) REFERENCES clazz(cno) ON DELETE CASCADE--级联删除
       CONSTRAINT fk_student_cno FOREIGN KEY(cno) REFERENCES clazz(cno) --级联设空
);

--删除202班级记录
DELETE FROM clazz WHERE cno=202;

-- 强制删除主表(级联删除约束)
DROP TABLE clazz CASCADE CONSTRAINT;


-- 修改表结构，恢复student表外键约束
ALTER TABLE student DROP CONSTRAINT ck_student_age;

CREATE TABLE student(
       sno NUMBER(3),
       sname VARCHAR2(15) CONSTRAINT nn_student_sname NOT NULL,--只能在字段级别添加
       gender CHAR(3) DEFAULT '男',
       age NUMBER(2),
       sdate DATE,
       sclass VARCHAR(30),
       email VARCHAR2(30),
       cno NUMBER(3)
);

--在修改表的同时添加约束
ALTER TABLE student ADD CONSTRAINT 
pk_student_sno PRIMARY KEY (sno);
ALTER TABLE student ADD CONSTRAINT 
fk_student_cno FOREIGN KEY (cno) REFERENCES clazz(cno);
ALTER TABLE student ADD CONSTRAINT 
ck_student_age CHECK(age BETWEEN 18 AND 30);
ALTER TABLE student ADD CONSTRAINT 
ck_student_gender CHECK(gender IN ('男','女'));
ALTER TABLE student ADD CONSTRAINT 
uk_student_email UNIQUE(email);



