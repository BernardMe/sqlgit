




-- 后管消息中心纪录表
-- 短信记录表

SELECT t.* FROM chelaishun.t_sendmsg_log t WHERE t.id = 5;





-- 查最后一条记录
SELECT t.* FROM chelaishun.t_sendmsg_log t order by t.id DESC limit 1 ;

