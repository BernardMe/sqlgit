

-- ### 联合测试数据



-- BTH
-- 查询车辆来源渠道-->
-- id="qryCarChannel" parameterType="java.lang.String" resultType="java.lang.String">
select o.source_type as sourceType from t_order o left join t_etccard e on e.order_id=o.id where e.etc_number= '' -- #{etcNumber}
;





-- BTH
-- 查询账户信息 -->
-- id="queryOverDue" parameterType="java.util.HashMap" resultMap="queryIdResult">
SELECT id,phone_number,idcard_num,name,open_id, channel_name FROM t_account where 1=1 and id = '99990106600000000658422'  -- #{id}
;
