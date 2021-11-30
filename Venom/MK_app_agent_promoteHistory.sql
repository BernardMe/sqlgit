
















-- 渠道
-- // 根据车牌号查询推广记录
SELECT t.* FROM cls_market_etc.cls_market_etc_agent_promote_history t WHERE t.car_no = '豫PF0671';


SELECT COUNT(t.id) FROM cls_market_etc.cls_market_etc_agent_promote_history t WHERE t.active_time between CAST('2021-09-01 00:00:00' AS DATE) AND CAST('2021-10-01 00:00:00' AS DATE);

-- // 根据手机号查询银行卡详情
SELECT t.id, agent_id, real_name, id_card, bank_name, card_no, phone_num, update_time, create_time FROM cls_market_etc.cls_market_etc_agent_bank_card t WHERE t.phone_num = '13060047683';


-- 查最后一条记录



-- //





-- 查


-- 查




-- auth项目纪录表_t_sms_union_log_分析短信内容(含车来顺etc签名)
SELECT COUNT(t.id) FROM chelaishun.t_sms_union_log t WHERE t.content LIKE '【车来顺etc】%';



## #################################
#				   #
# 这里是正式环境SQL #
#				   #
#				   #
## #################################



-- auth项目纪录表_t_sms_union_log_分析短信内容(状态失败 0：通讯成功;1:发送成功；2：发送失败；3.通讯失败)
SELECT COUNT(t.id) FROM chelaishun.t_sms_union_log t WHERE t.state = 0;


-- 月账单统计确认>>>smsChannel短信渠道 1:诚立业 2:梦网 3:聚梦
-- // 查询smsChannel是聚梦
SELECT COUNT(t.id) FROM chelaishun.t_sms_union_log t WHERE t.sms_channel = 3 AND t.state = 0 AND t.create_time < STR_TO_DATE('2021-10-01 00:00:00', '%Y-%m-%d %H:%i:%s');

-- 跟进seqId查询
SELECT t.id, t.id, mobile, content, state, result_desc, seq_id, msg_id, result_status, status_des, sms_channel, create_time FROM chelaishun.t_sms_union_log t WHERE t.sms_channel = 3 AND t.state = 0 AND t.seq_id = '2110041906090823622';
