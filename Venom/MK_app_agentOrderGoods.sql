



-- 返回我的代理产品


-- 根据agentId查询代理商设备列表详情
-- queryOrderGoodsByParam
-- 卡未激活，设备未激活，已激活, 已损坏
SELECT
       t.id as id,
       t.card_sn as cardSn,
       t.card_status as cardStatus,
       t.device_sn as deviceSn,
       t.device_status as deviceStatus,
       t.create_time as createTime
FROM cls_market_etc.cls_market_etc_agent_order_goods t
WHERE t.agent_id = 5
-- AND t.card_status = 1 -- {cardNoActive = 1  cardStatus}
 AND t.device_status = 1  -- {deviceNoActive =2  deviceStatus}

-- AND t.card_status = 2  -- {cardActivated =3 cardStatus} 已激活以卡status为主，查询

-- AND t.card_status = 4  -- {cardActivated =3 cardStatus} 已损坏以卡status为主，查询
 ORDER BY t.create_time
;



-- 根据设备sn号更新设备状态
-- updateDeviceStatusBySn
update cls_market_etc.cls_market_etc_agent_order_goods t
set
 t.device_status = 4 , -- #{status}, " +
 t.update_time = NOW()  -- NOW() " +
where t.device_sn = '1111111111111101'  --  #{sn}
;


