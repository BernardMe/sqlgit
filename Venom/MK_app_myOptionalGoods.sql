





-- 可采购的产品列表

SELECT t.* FROM cls_market_etc.cls_market_etc_goods t WHERE t.id = 1;


-- 当前代理商已经代理的产品
select ag.*  FROM cls_market_etc.cls_market_etc_agent_goods ag where ag.agent_id = 5;




