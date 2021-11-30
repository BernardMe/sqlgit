





-- 加入黑名单记录
-- 1
select t.*
from chelaishun.mgt_mauthqueue t
where DATE_FORMAT(t.createTime, '%Y-%m-%d %H:%i') <= DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i');




-- 查询入黑名单记录
-- 2
SELECT t.* FROM chelaishun.mgt_mauthqueue t order by t.carid DESC limit 1 ;

