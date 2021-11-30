



-- 数据小管家 - 本周统计数据排序
SELECT agent_id as agentId, sum(card_count) as cardCount, sum(passage_times) as passageTimes, sum(passage_amount) as passageAmount, stats_date as statsDate
FROM cls_market_etc_agent_day_stats
WHERE stats_date BETWEEN DATE('2021-10-25') AND DATE('2021-10-31')
GROUP BY agentId
ORDER BY cardCount DESC
;



-- 数据小管家 - 本月统计数据排序
SELECT agent_id as agentId, sum(card_count) as cardCount, sum(passage_times) as passageTimes, sum(passage_amount) as passageAmount, stats_date as statsDate
FROM cls_market_etc_agent_day_stats
WHERE stats_date BETWEEN DATE('2021-09-01') AND DATE('2021-11-01')
GROUP BY agentId
ORDER BY cardCount DESC
;



-- 数据小管家 - 本年统计数据排序
SELECT agent_id as agentId, sum(card_count) as cardCount, sum(passage_times) as passageTimes, sum(passage_amount) as passageAmount, stats_date as statsDate
FROM cls_market_etc_agent_day_stats
WHERE stats_date BETWEEN DATE('2021-01-01') AND DATE('2022-01-01')
GROUP BY agentId
ORDER BY cardCount DESC
;
