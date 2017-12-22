-- 常用对象之用户：user

--创建用户
--必须是dba权限
CREATE USER wxcedb IDENTIFIED BY wxcedb; --密码bjsxt

--#给bjsxt分配权限
--##系统权限
GRANT CREATE SESSION TO wxcedb;
GRANT CREATE SEQUENCE TO wxcedb;


--###撤销权限
REVOKE CREATE SESSION FROM bjsxt;
REVOKE CREATE SEQUENCE FROM bjsxt;


--普通用户一般授予connect，resource角色
--管理员 dba
--##角色权限
GRANT RESOURCE TO wxcedb;
REVOKE RESOURCE FROM bjsxt;


--删除用户
--DROP USER bjsxt;

--解锁用户
--ALTER USER hr ACCOUNT LOCK;
--ALTER USER hr ACCOUNT UNLOCK;

--ALTER USER hr IDENTIFIED BY hr;






