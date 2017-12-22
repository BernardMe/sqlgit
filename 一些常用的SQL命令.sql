
-- 这里是注释

-- 切换用户
conn scott/tiger


-- 显示当前登录的用户
show user;

-- 解锁用户
alter user scott accout unlock;

-- 锁定用户
alter user scott accout lock;

-- 修改用户密码
alter user scott identifier '123456';


-- sqlplus设置行宽
set line 200;

