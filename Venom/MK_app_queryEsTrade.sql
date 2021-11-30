z





-- 可采购的产品列表

SELECT t.* FROM cls_market_etc.cls_market_etc_es_trade t WHERE t.id = 5;


-- // 当前代理商如果已经存在申请补货订单不能再次创建申请补货订单
select ao.*  FROM cls_market_etc.cls_market_etc_agent_order ao where ao.status = 1 AND ao.agent_id = 5;




