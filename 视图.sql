

--视图



--创建视图需要dba权限
--授权dba权限to 用户bjsxt
GRANT DBA TO bjsxt;

CREATE OR REPLACE VIEW view_stu AS (
       SELECT * FROM student
);

--视图可以隐藏表格的部分数据
CREATE OR REPLACE VIEW view_stu AS (
       SELECT sno, sname, cno FROM student
);

SELECT * FROM view_stu;

--通过view修改数据 插入数据 删除数据
UPDATE view_stu SET sname='刘备' WHERE sno=112;
INSERT INTO view_stu VALUES(114, '赵云', 202);
DELETE view_stu WHERE sno=114;
--报错 ORA-00913:值过多
INSERT INTO view_stu VALUES(114, '赵云', '男', 17, 202);

--将复杂的查询简单化
--- 统计所有班级的详细信息以及班级的人数和平均年龄
SELECT COUNT(s.sno), AVG(age), c.cno
FROM student s, clazz c
WHERE s.cno(+) = c.cno
GROUP BY c.cno
;



--定义只读视图: 只能执行DQL, 不能执行DML
CREATE OR REPLACE VIEW view_cla AS (
     SELECT c.*,COUNT(s.sno) countStu, AVG(age) avrAge
     FROM student s, clazz c
     WHERE s.cno(+) = c.cno
     GROUP BY c.cno, c.cname, c.cdate
)WITH READ ONLY;

--插入数据报错 ORA-01733: 此处不允许虚拟列
INSERT INTO view_cla VALUES(4, 23, 202);

--直接调用视图
SELECT * FROM view_cla;


-- 基于视图来创建视图
CREATE OR REPLACE VIEW view_test AS (SELECT cname, countStu FROM view_cla);
SELECT * FROM view_test;



