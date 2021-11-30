



-- 后管分润管理

-- 根据
-- 分页查询代理商分润信息
SELECT *
FROM cls_market_etc.cls_market_etc_agent
WHERE role = 11
and audit_status IN (3, 4, 5)
ORDER BY total_active_bonus DESC, total_first_consume_bonus DESC
;








-- 总行数
SELECT COUNT(1) FROM cls_market_etc.cls_market_etc_agent t WHERE 1 = 1 AND staff_id = 1 AND t.audit_status = 3 AND t.status = 2
;










