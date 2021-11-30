



-- 根据id查询我的成员
-- 根据agentId查询Role
SELECT t.role
FROM cls_market_etc.cls_market_etc_agent t
WHERE t.id = 1
;

-- queryFellowByParam
SELECT t.id as agentId,
       t.real_name as realName,
       t.role as agentLevel,
       t.create_time as createTime
FROM cls_market_etc.cls_market_etc_agent t
WHERE 1 = 1
-- AND t.staff_id = 1 -- {agentLevel}
 AND t.agent1_id = 4 -- {agentLevel}
-- AND t.agent2_id = 5  -- {agentLevel}
AND t.audit_status = 3  -- {auditStatus}
AND t.status = 2 -- status
ORDER BY t.create_time
;


-- 总行数
SELECT COUNT(1) FROM cls_market_etc.cls_market_etc_agent t WHERE 1 = 1 AND staff_id = 1 AND t.audit_status = 3 AND t.status = 2
;





-- 根据agentId查询代理商设备列表详情
-- queryOrderGoodsByParam
-- 卡未激活，设备未激活，已激活
SELECT
       t.id as id,
       t.card_sn as cardSn,
       t.card_status as cardStatus,
       t.device_sn as deviceSn,
       t.device_status as deviceStatus,
       t.create_time as createTime
FROM cls_market_etc.cls_market_etc_agent_order_goods t
WHERE t.agent_id = 5
-- AND t.card_status = 1 -- {cardNoActive = 1  cardStatus}
-- AND t.device_status = 1 -- {deviceNoActive =2  deviceStatus}

 AND t.card_status = 2 -- {cardActivated =3 cardStatus} 已激活以卡status未主，查询
 ORDER BY t.create_time
;



-- 传入成员agentId再查询
SELECT
       t.id as id,
       t.card_sn as cardSn,
       t.card_status as cardStatus,
       t.device_sn as deviceSn,
       t.device_status as deviceStatus,
       t.create_time as createTime
FROM cls_market_etc.cls_market_etc_agent_order_goods t
WHERE 1=1
 AND (t.agent_id = 5 OR t.agent2_id = 5)
-- AND t.card_status = 1 -- {cardNoActive = 1  cardStatus}
-- AND t.device_status = 1 -- {deviceNoActive =2  deviceStatus}
-- AND t.card_status = 2 -- {cardActivated =3 cardStatus} 已激活以卡status未主，查询
 ORDER BY t.create_time
;




SELECT COUNT(1) FROM cls_market_etc_agent_order_goods t WHERE (t.agent_id = 5 OR ((t.agent2_id = 5)) AND t.card_sn IS NOT NULL AND t.card_status IN (1, 3, 4))
;


