

--事务管理

/*一个事务起源于一条DML语句
结束于以下情况：
用户显示执行commit 或 rollback
用户执行 DDL(insert update delete)
数据库正常连接断开，事务会自动提交
非正常断开连接时，自动回滚事务
*/


DROP TABLE acct;
--创建银行帐户表
CREATE TABLE acct (
       aid NUMBER(3) not null,
       aname  VARCHAR2(15),
       amoney NUMBER(7,2),
       
       --表级别添加主键约束
       CONSTRAINT pk_acct PRIMARY KEY (aid)
);



--插入数据
INSERT INTO acct values(001, '张三', 10000);
INSERT INTO acct values(002, '李四', 100);
INSERT INTO acct values(003, '王五', 20000);

--查询数据
SELECT ROWNUM, t.* FROM acct t;

DELETE acct WHERE amoney=20000;



--转账事务
UPDATE acct SET amoney=amoney-1000 WHERE aid=001;
UPDATE acct SET amoney=amoney+1000 WHERE aid=002;

--提交
COMMIT;

--回滚
ROLLBACK;


--用户执行 DDL，事务会自动提交
DROP VIEW view_cla;

