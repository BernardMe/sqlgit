



-- dao.AgentOrderGoodsDao


-- 查询代理商手中指定商品还未激活的卡数量
-- countOfNoActive
-- 未激活，未激活，已激活, 已损坏
SELECT
       COUNT(t.id) count
FROM cls_market_etc.cls_market_etc_agent_order_goods t
WHERE t.agent_id = 134
 AND t.goods_id = 1
 AND t.card_sn IS NOT NULL
 AND t.card_status = 1  -- {card_status = 1卡未激活}
;



-- 查询代理商手中指定商品已激活的卡数量
-- countOfActivated

;



-- 移动端_分页查询我的或下级成员的订单商品列表
-- queryPage4Agent
--
SELECT a.*
FROM (
         SELECT og.*
         FROM cls_market_etc_agent_order_goods AS og
         WHERE (og.agent_id = 132 AND og.card_sn IS NOT NULL AND ((og.card_status = 1 OR og.card_status = 3)))
     ) a
LEFT JOIN (select og.agent_id, og.card_sn, og.device_sn
           from cls_market_etc_agent_return_goods as og
           where (og.agent_id = 132 AND og.card_sn IS NOT NULL AND ((og.card_status = 1 OR og.card_status = 3))) and og.status='0'
    ) b ON a.card_sn = b.card_sn WHERE b.card_sn IS NULL
-- ORDER BY create_time DESC
;




SELECT a.*
FROM (
         SELECT og.*
         FROM cls_market_etc_agent_order_goods AS og
         WHERE (og.agent_id = 132 AND og.device_sn IS NOT NULL AND ((og.device_status = 1 OR og.device_status = 3)))
     ) a
LEFT JOIN (select og.agent_id, og.card_sn, og.device_sn
           from cls_market_etc_agent_return_goods as og
           where (og.agent_id = 132 AND og.device_sn IS NOT NULL AND ((og.device_status = 1 OR og.device_status = 3))) and og.status='0'
    ) b ON a.device_sn = b.device_sn WHERE b.device_sn IS NULL
-- ORDER BY create_time DESC
;




