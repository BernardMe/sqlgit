



-- 根据id查询我的成员
-- 根据agentId查询Role
SELECT t.agent_id
FROM cls_market_etc.cls_market_etc_agent_promote_history t
WHERE t.id = 1
;


-- queryBonusByParam
-- TYPE 首次激活
SELECT t.id as agentId,
       t.active_time as activeTime,
       t.active_bonus as activeBonus,
       CASE
           WHEN a.role = 1  THEN '员工'
           WHEN a.role = 11  THEN '一级代理'
           WHEN a.role = 13  THEN '二级代理'
           WHEN a.role = 13  THEN '三级代理'
        END as role,
       a.real_name as realName
FROM cls_market_etc.cls_market_etc_agent_promote_history t
INNER JOIN cls_market_etc.cls_market_etc_agent a ON a.id = t.agent_id
WHERE 1 = 1
AND (t.agent_id = 3 OR t.staff_id = 3)  -- {员工agentId}
# AND (t.agent_id = 3 OR t.agent1_id = 3)  -- {一级agentId}
# AND (t.agent_id = 3 OR t.agent2_id = 3)  -- {二级agentId}
# AND t.agent_id = 3  -- {三级agentId}
AND t.active_bonus > 0
ORDER BY t.create_time
;


-- queryBonusByParam
-- TYPE 通行分润
SELECT t.id as agentId,
       t.first_consume_time as consumeTime,
       t.first_consume_bonus as firstConsumeBonus
FROM cls_market_etc.cls_market_etc_agent_promote_history t
WHERE 1 = 1
AND (t.agent_id = 3 OR t.agent1_id = 3 OR t.agent2_id = 3)  -- {agentId}
AND t.first_consume_bonus > 0
ORDER BY t.create_time
;



-- 总行数
SELECT COUNT(1) FROM cls_market_etc.cls_market_etc_agent t WHERE 1 = 1 AND staff_id = 1 AND t.audit_status = 3 AND t.status = 2
;



SELECT t.id            as id,
       t.card_sn       as cardSn,
       t.card_status   as cardStatus,
       t.device_sn     as deviceSn,
       t.device_status as deviceStatus,
       t.create_time   as createTime
FROM cls_market_etc.cls_market_etc_agent_order_goods t
WHERE (t.agent_id = 4 OR ((t.agent1_id = 4))) AND t.device_sn IS NULL AND t.card_sn IS NOT NULL /*AND t.card_status = 2*/
ORDER BY t.create_time ASC
;


SELECT COUNT(1) FROM cls_market_etc.cls_market_etc_agent_order_goods t WHERE (t.agent_id = 4 AND ((t.agent1_id = 4)) AND t.device_sn IS NULL AND t.card_sn IS NOT NULL)







