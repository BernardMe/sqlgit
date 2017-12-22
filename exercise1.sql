
--创建部门表
CREATE TABLE department(
       dno NUMBER(10),
       dname VARCHAR2(32),
       
       --在表级别定义主键约束
       --定义主键约束
       CONSTRAINT pk_dno PRIMARY KEY (dno)
);

--创建员工表
CREATE TABLE employee(
       e_no NUMBER(10),
       e_name VARCHAR2(12) NOT NULL,
       e_age NUMBER(3) NOT NULL,
       e_laborage NUMBER(8,2) NOT NULL,
       e_address VARCHAR2(128),
       e_deptno  NUMBER(10) NOT NULL REFERENCES department (dno),
       
       --在表级别定义主键约束
       --定义主键约束
       CONSTRAINT pk_emp_eno PRIMARY KEY (e_no)
);

INSERT INTO department VALUES (10, '开发部');
INSERT INTO department VALUES (20, '销售部');
INSERT INTO department VALUES (30, '财务部');
INSERT INTO department VALUES (40, '后勤部');

INSERT INTO employee VALUES (001, '王五', 25, 1000.00, '上奥小区', 10);
INSERT INTO employee VALUES (002, '赵六', 25, 1250.00, '上奥东区', 10);

--创建序列
CREATE SEQUENCE seq_emp_eno;

SELECT * FROM employee;
SELECT * FROM department;

SELECT seq_emp_eno.currval FROM dual;


SELECT * FROM employee t WHERE e_name like '%王%';

