



-- 查询统计信息
-- 根据日期范围查询数据(当前周/)
SELECT ifnull(sum(increase_agent_count), 0) as increaseAgentCount,
       ifnull(max(total_agent_count), 0) as totalAgentCount,
       ifnull(max(total_agent1_count), 0) as totalAgent1Count,
       ifnull(max(total_agent2_count), 0) as totalAgent2Count,
       ifnull(max(total_agent3_count), 0) as totalAgent3Count,
       ifnull(sum(increase_card_count), 0) as increaseCardCount,
       ifnull(max(total_card_count), 0) as totalCardCount,
       max(stats_date) as statsDate
FROM cls_market_etc_day_stats
WHERE
 DATE(stats_date) BETWEEN DATE('2021-10-25 00:00:00') AND DATE('2021-10-31 23:59:59')
;
-- MMMM

;



-- 查询统计信息
-- 根据日期范围查询数据(上一周/)
SELECT ifnull(sum(increase_agent_count), 0) as increaseAgentCount,
       ifnull(max(total_agent_count), 0) as totalAgentCount,
       ifnull(max(total_agent1_count), 0) as totalAgent1Count,
       ifnull(max(total_agent2_count), 0) as totalAgent2Count,
       ifnull(max(total_agent3_count), 0) as totalAgent3Count,
       ifnull(sum(increase_card_count), 0) as increaseCardCount,
       ifnull(max(total_card_count), 0) as totalCardCount,
       max(stats_date) as statsDate
FROM cls_market_etc_day_stats
WHERE
 DATE(stats_date) BETWEEN DATE('2021-10-18 00:00:00') AND DATE('2021-10-24 23:59:59')
;





-- 查询统计信息
-- 根据日期范围查询数据(当前年份/)
SELECT ifnull(sum(increase_agent_count), 0) as increaseAgentCount,
       ifnull(max(total_agent_count), 0) as totalAgentCount,
       ifnull(max(total_agent1_count), 0) as totalAgent1Count,
       ifnull(max(total_agent2_count), 0) as totalAgent2Count,
       ifnull(max(total_agent3_count), 0) as totalAgent3Count,
       ifnull(sum(increase_card_count), 0) as increaseCardCount,
       ifnull(max(total_card_count), 0) as totalCardCount,
       max(stats_date) as statsDate
FROM cls_market_etc_day_stats
WHERE
 DATE(stats_date) BETWEEN DATE('2021-10-18 00:00:00') AND DATE('2021-10-24 23:59:59')
;