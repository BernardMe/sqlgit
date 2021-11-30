



-- 计算一级代理分润奖励
-- 查询一级代理本月已累计推广用户数量
SELECT t.*
FROM cls_market_etc_agent_promote_history t
WHERE 1=1
AND (t.agent_id  = 95 OR t.agent1_id = 95)
AND t.active_bonus_status = 2
# ORDER BY t.id ASC
# LIMIT 200

;
