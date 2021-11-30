



-- 数据小管家 
-- 统计 statsDate 累计发卡量 #过滤已结算#
SELECT COUNT(1) as totalCardCount
FROM cls_market_etc_agent_promote_history
WHERE etc_account IS NOT NULL  -- etc_account不为空
AND active_bonus_status = 2   -- 已结算
AND DATE(active_time) < DATE('2021-10-27 23:59:59')
;



-- 数据小管家
-- 统计 statsDate 累计1级代理商数量
SELECT COUNT(1)
FROM cls_market_etc_agent
WHERE audit_status IN (3, 4, 5)
AND role = 11
AND DATE(create_time) <= DATE('2021-10-24 23:59:59')
;



-- 数据小管家
-- 统计 statsDate 累计2级代理商数量
SELECT COUNT(1)
FROM cls_market_etc_agent
WHERE audit_status IN (3, 4, 5)
AND role = 12
AND DATE(create_time) <= DATE('2021-10-24 23:59:59')
;



-- 数据小管家
-- 统计 statsDate 累计3级代理商数量
SELECT COUNT(1)
FROM cls_market_etc_agent
WHERE audit_status IN (3, 4, 5)
AND role = 13
AND DATE(create_time) <= DATE('2021-10-24 23:59:59')
;



-- 数据小管家
-- 计算累计代理商数量
SELECT (42 + 52 + 4) as totalAgentCount FROM DUAL
;



-- 数据小管家
-- 查询 statsDate-1 统计信息
SELECT t.* FROM cls_market_etc_day_stats t WHERE DATE(t.stats_date) = DATE('2021-10-23 23:59:59')
;



-- 数据小管家
-- 计算发卡量增量
SELECT (471 - 471) as increaseCardCount FROM DUAL
;



-- 数据小管家
-- 计算代理商数量增量
SELECT (98 - 98) as increaseAgentCount FROM DUAL
;
