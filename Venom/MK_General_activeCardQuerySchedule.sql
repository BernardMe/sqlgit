




-- e推客
-- 分页查询需要查询卡号的推广记录列表
-- queryCanQueryActiveCardList
SELECT * FROM cls_market_etc_agent_promote_history
WHERE card_sn IS NULL
ORDER BY id ASC
;


SELECT * FROM cls_market_etc_agent_promote_history WHERE etc_account = '11082000102997';


-- e推客
-- 根据ETC卡号获得对于的商品代理信息
-- findOneByCardSn
SELECT *
FROM cls_market_etc_agent_order_goods
WHERE card_sn  = '1901230007505050' --
OR card_sn = '11011901230007505050'   --

;




;
