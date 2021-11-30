



-- 更新cls_market_etc_agent_goods中obu_stock和obu_sales数据
UPDATE cls_market_etc.cls_market_etc_goods a
INNER JOIN (SELECT t.id, t.stock, t.sales FROM cls_market_etc.cls_market_etc_goods t WHERE t.id = 1) b ON a.id = b.id
SET a.obu_stock = b.stock, a.obu_sales = b.sales
WHERE a.id = 1
;







