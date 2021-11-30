





-- 描述表结构
desc chelaishun.t_sms_union_log;

-- 查看建表语句
show create table chelaishun.t_sms_union_log;

-- 短信记录表
SELECT t.* FROM chelaishun.t_sms_union_log t WHERE t.id = 5;


-- smsChannel短信渠道 1:诚立业 2:梦网 3:聚梦
-- // 查询smsChannel是聚梦
SELECT t.* FROM chelaishun.t_sms_union_log t WHERE t.sms_channel = 3;
-- 查最后一条记录
SELECT t.* FROM chelaishun.t_sms_union_log t order by t.id DESC limit 20 ;



-- 查手机号最后一条记录
SELECT t.* FROM chelaishun.t_sms_union_log t order by t.id DESC limit 1 ;






-- auth项目纪录表_t_sms_union_log_分析短信内容(含车来顺etc签名)
SELECT COUNT(t.id) FROM chelaishun.t_sms_union_log t WHERE t.content LIKE '【车来顺etc】%';





# -- 清楚数据
# DELETE FROM chelaishun.t_sms_union_log  WHERE create_time like '2021-09-18%' ;





-- 批量
# insert into chelaishun.t_sms_union_log(mobile, content, state, seq_id,ds_time, ext, msg_id, result_status, status_des, business_src, sms_channel, create_time, update_time)
# result_status
# status_des
# business_src
# sms_channel
# create_time
# update_time