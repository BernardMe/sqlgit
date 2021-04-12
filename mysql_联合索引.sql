

--

-- 悲观锁

-- 悲观锁的实现，往往依靠数据库提供的锁机制
-- （也只有数据库层提供的锁机制才能真正保证数据访问的排他性，否则，即使在本系统中实现了 加锁机制，也无法保证外部系统不会修改数据）

-- 我们可以使用命令设置MySQL为非autocommit模式：

-- set autocommit=0;

-- 536563	new2 - 阿尔卡特 (OT-927) 炭黑 联通3G手机 双卡双待	清仓！仅北京，武汉仓有货！	29900000	99999	""	http://image.egou.com/jd/4ef8861cf6854de9889f3db9b24dc371.jpg	560	1	2015-03-08 21:33:18	2015-04-11 20:38:38


truncate t_goods;

-- 3.5.1 建立索引
-- 1. CREATE INDEX命令语法:
select status from t_goods where id=1 for update;

rollback;

--
select status from t_goods where id=1;
