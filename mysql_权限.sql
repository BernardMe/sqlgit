

-- mysql_权限

-- 创建 mysql账号密码（账号密码自定 权限自定）

CREATE USER canal IDENTIFIED BY 'canal';
	GRANT SELECT, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'canal'@'%';
	/*-- GRANT ALL PRIVILEGES ON *.* TO 'canal'@'%' ;*/
	FLUSH PRIVILEGES;

