



-- 数据小管家 #代理商
-- 统计代理商 statsDate 这一天的发卡量
-- 仅查询statsDate 这一天的数据
SELECT COUNT(1) as totalCardCount
FROM cls_market_etc_agent_promote_history
WHERE etc_account IS NOT NULL  -- etc_account不为空
AND (agent_id = 51 OR agent1_id = 51)  --
AND DATE(create_time) BETWEEN DATE('2021-10-27 00:00:00') AND DATE('2021-10-27 23:59:59')
;






;
