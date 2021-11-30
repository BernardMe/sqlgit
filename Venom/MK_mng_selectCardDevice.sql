



-- 后管分润管理

-- 根据
-- 分页查询设备列表  // 查询卡
SELECT *
FROM cls_market_etc.cls_market_etc_agent_order_goods as og
left join cls_market_etc_agent as agent on agent.id = og.agent_id
WHERE 1=1
# AND agent.real_name = ''
# AND agent.phone = ''
# AND agent.role = 11
-- AND og.card_sn = ''
AND og.card_status = 1
-- AND og.card_sn = ''
;




-- 分页查询设备列表  // 查询设备
SELECT *
FROM cls_market_etc.cls_market_etc_agent_order_goods as og
left join cls_market_etc_agent as agent on agent.id = og.agent_id
WHERE 1=1
# AND agent.real_name = ''
# AND agent.phone = ''
# AND agent.role = 11
AND og.device_sn = ''
AND og.device_status = 1
AND og.card_sn IS NULL
AND og.device_sn IS NOT NULL





;










