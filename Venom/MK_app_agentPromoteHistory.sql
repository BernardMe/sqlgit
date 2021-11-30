





-- 分页查询可结算激活奖励的推广记录列表
-- 查询条件-ETC卡号存在
-- 查询条件-激活奖励未结算
select * from cls_market_etc_agent_promote_history
where card_sn is not null 
and active_bonus_status = 1 -- {activeBonusStatus} 
order by id asc;


-- // 当前代理商如果已经存在申请补货订单不能再次创建申请补货订单
select ao.*  FROM cls_market_etc.cls_market_etc_agent_order ao where ao.status = 1 AND ao.agent_id = 5;




