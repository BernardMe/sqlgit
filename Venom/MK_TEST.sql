



-- 数据小管家 - 本月统计数据排序

SELECT t.*
FROM cls_market_etc_agent_day_stats t
WHERE t.passage_amount > 0
OR t.passage_times > 0

;
