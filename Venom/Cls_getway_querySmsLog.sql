z





-- 短信记录表

SELECT t.* FROM chelaishun.t_msg_log t WHERE t.id = 5;





-- 查最后一条记录
SELECT t.* FROM chelaishun.t_msg_log t order by t.id DESC limit 1 ;

