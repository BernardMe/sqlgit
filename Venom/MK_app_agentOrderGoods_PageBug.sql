



-- 返回我的代理产品
SELECT t.*
FROM (
    SELECT id,
           agent_id,
           order_id,
           goods_id,
           update_time,
           device_sn,
           device_status,
           create_time,
           card_sn,
           agent1_id,
           agent2_id,
           card_status,
           staff_id
    FROM cls_market_etc_agent_order_goods as og
    WHERE (agent_id = 136 AND card_sn IS NOT NULL AND card_status = 1)
    ORDER BY create_time DESC) t
LIMIT 0,10
;


-- !!!错误SQL
SELECT id,
       agent_id,
       order_id,
       goods_id,
       update_time,
       device_sn,
       device_status,
       create_time,
       card_sn,
       agent1_id,
       agent2_id,
       card_status,
       staff_id
FROM cls_market_etc_agent_order_goods
WHERE (agent_id = 136 AND card_sn IS NOT NULL AND card_status = 1)
ORDER BY create_time DESC
LIMIT 0,10
;





