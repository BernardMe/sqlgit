





-- 短信记录来源
-- 1定时发送短信
select MSG_TYPE      msgType,
       MSG_CONTENT   content,
       RESOURCE_TYPE resourceType,
       CRT_TIME      crtTime,
       SEND_TIME     sendTime,
       USER_ID       userId,
       LOGIN_WAY     loginWay,
       LANDING_PAGE  landingPage,
       MSG_ID        msgId,
       TITLE         title
from t_schedule_sendmsg
where DATE_FORMAT(SEND_TIME, '%Y-%m-%d %H:%i') = DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i');




-- cop项目纪录表_t_msg_log_分析短信内容(含车来顺etc签名)
SELECT t.* FROM chelaishun.t_msg_log t WHERE t.content NOT LIKE '【车来顺etc】%';


-- cop项目纪录表_t_msg_log_分析短信内容(非包含车来顺etc签名)
SELECT t.* FROM chelaishun.t_msg_log t WHERE t.content NOT LIKE '【车来顺etc】%';


-- 短信记录来源
-- 2击穿发短信)
SELECT t.* FROM chelaishun.t_msg_log t order by t.id DESC limit 1 ;

