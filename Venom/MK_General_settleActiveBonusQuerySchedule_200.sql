



-- 计算一级代理分润奖励
SELECT t.*
FROM cls_market_etc_agent_promote_history t
WHERE 1=1
AND (t.agent_id  = 95 OR t.agent1_id = 95)
AND t.active_bonus_status = 2
ORDER BY t.id ASC
LIMIT 200
;


-- 线下
SELECT t.*
FROM cls_market_etc_agent_promote_history t
WHERE 1=1
AND (t.agent_id  = 13 OR t.agent1_id = 13)
AND t.active_bonus_status = 2
AND t.method = 'S'
ORDER BY t.id ASC
LIMIT 200
;


-- 线上
SELECT t.*
FROM cls_market_etc_agent_promote_history t
WHERE 1=1
AND (t.agent_id  = 13 OR t.agent1_id = 13)
AND t.active_bonus_status = 2
AND t.method = 'E'
ORDER BY t.id ASC
LIMIT 200
;	



-- 首超200当月月推量全量计算额外奖励
-- calculateBonus4extBonusFirstAchieve

SELECT
FROM cls_market_etc_agent_order_goods t
WHERE t

