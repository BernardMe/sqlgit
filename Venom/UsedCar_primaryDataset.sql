



-- 数据简报接口
--
--
-- 数据简报接口
--
--
;





-- 今日入驻申请
-- dailySettleApplyAmount
-- 申请状态，0待审批，1通过，2拒绝
SELECT COUNT(1) as dailySettleApplyAmount FROM cls_used_car.t_usedcar_merchant t
WHERE DATE(t.create_time) = DATE('2021-10-19')
AND t.firm_status IS NOT NULL
;



-- 今日车辆申请
-- dailyTruckApplyAmount
-- 审核状态，0待审核，1审核通过，2审核拒绝，3拒绝并已重新提交
SELECT COUNT(1) as truckApplyAmount FROM cls_used_car.t_usedcar_info t
WHERE DATE(t.create_time) = DATE('2021-08-19')
AND t.status IS NOT NULL
;



-- 查询入驻卖家总量
-- countSettledMerchant
-- 申请状态，0待审批，1通过，2拒绝
SELECT COUNT(t.id) as countSettledMerchant
FROM cls_used_car.t_usedcar_merchant t
WHERE t.firm_status = '1'
;


-- 查询发布车辆总量
-- countReleasedTruck
-- 审核状态，0待审核，1审核通过，2审核拒绝，3拒绝并已重新提交
SELECT COUNT(t.id) as countReleasedTruck
FROM cls_used_car.t_usedcar_info t
WHERE t.status = '1'
;



