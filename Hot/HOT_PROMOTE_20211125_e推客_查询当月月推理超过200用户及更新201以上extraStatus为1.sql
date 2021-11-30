

-- e推客_查询当月月推理超过200用户
-- 查询可结算激活奖励的推广记录列COUNT值
-- !~^PPP_DB ***数据查询_A
-- [查询思路] 按照agentId分组 AND 过滤{card_sn不为空，激活奖励状态包含(待结算|已结算), 激活时间在'2021-11-01 00:00:00'-'2021-11-31 23:59:59'} AND 按照count值DESC排序
SELECT t.*
FROM (
    select agent_id agentId, COUNT(id) count
    from cls_market_etc_agent_promote_history
    where card_sn is not null
    and active_bonus_status in  (1, 2) -- {activeBonusStatus}
    and (active_time between STR_TO_DATE('2021-11-01 00:00:00', '%Y-%m-%d %H:%i:%s') AND STR_TO_DATE('2021-11-31 23:59:59', '%Y-%m-%d %H:%i:%s'))
    group by agent_id) t
ORDER BY t.count DESC;




-- ################## WARNING  以下操作请务必谨慎操作(每次执行只处理一个agent)  ##################
-- !~^PPP_DB ***数据查询_B
-- [查询思路] 根据agentId查询所有promote记录并且按照id排序每页200条  查询第2页及以后的数据  关键要多行id通过英文逗号拼接为idStr
SELECT GROUP_CONCAT(t.id) idStr
FROM (
    select *
    from cls_market_etc_agent_promote_history
    where agent_id = 125
    and card_sn is not null
    and active_bonus_status in  (1, 2) -- {activeBonusStatus}
    and (active_time between STR_TO_DATE('2021-11-01 00:00:00', '%Y-%m-%d %H:%i:%s') AND STR_TO_DATE('2021-11-31 23:59:59', '%Y-%m-%d %H:%i:%s'))
    order by agent_id, id
    limit 0, 200) t
;


-- e推客_更新201以上extraStatus为1
-- !~^PPP_DB >>>数据更新
-- [更新思路] 根据agentId查询所有promote记录并且按照id排序每页200条  查询第2页及以后的数据 并更新extra_status
UPDATE cls_market_etc.cls_market_etc_agent_promote_history a
SET a.update_time = NOW(), a.extra_status = 1   -- #{extra_status}
WHERE a.agent_id = 132
AND a.id IN ()    -- #{此处传入!~^PPP_DB ***数据查询_B获取的idStr}
;
-- ################## WARNING  以下操作请务必谨慎操作(每次执行只处理一个agent)  ##################








-- !~^PPP_DB ***数据查询_C
-- [查询思路] 根据agentId查询所有promote记录并且按照id排序每页200条  查询第2页及以后的数据
select *
from cls_market_etc_agent_promote_history
where agent_id = 132
and card_sn is not null
and active_bonus_status in  (1, 2) -- {activeBonusStatus}
and (active_time between STR_TO_DATE('2021-11-01 00:00:00', '%Y-%m-%d %H:%i:%s') AND STR_TO_DATE('2021-11-31 23:59:59', '%Y-%m-%d %H:%i:%s'))
limit 200, 200
;



