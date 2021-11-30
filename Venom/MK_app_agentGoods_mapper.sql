



-- 返回我的代理产品


/**
 * 失效代理商代理商品信息状态
 *
 * @param auditGoodsSkuId   卡数量增量
 * @param quantity 设备数量增量
 * @param id             id
 * @return 更新数据条数
 */
update cls_market_etc_agent_goods set
        is_enabled = true,  -- {isEnabled},
        update_time = NOW()
        where id = 1448992598837112835 -- #{id}
;


