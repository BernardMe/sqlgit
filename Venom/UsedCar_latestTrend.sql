



-- 趋势分布接口
--
--
-- 趋势分布接口
--
--
;






-- [进阶SQL]最近7天车辆申请/入驻申请;
-- 使用进阶SQL;
--

SELECT date(create_time) as dateStr, count(*) as dailySettleApply
FROM cls_used_car.t_usedcar_merchant
WHERE datediff(now(), create_time) <= 6
GROUP BY day(create_time)
;

SELECT date(create_time) as dateStr, count(*) as dailyTruckApply
FROM cls_used_car.t_usedcar_info
WHERE datediff(now(), create_time) <= 6
GROUP BY day(create_time)


;

-- ShardingSphere不支持union all
-- 最近7天商家入驻申请;
/*select a.dateStr as 'dateStr', ifnull(b.count,0) as 'dailySettleApply'
        from (
            SELECT curdate() as dateStr
            union all
            SELECT date_sub(curdate(), interval 1 day) as dateStr
            union all
            SELECT date_sub(curdate(), interval 2 day) as dateStr
            union all
            SELECT date_sub(curdate(), interval 3 day) as dateStr
            union all
            SELECT date_sub(curdate(), interval 4 day) as dateStr
            union all
            SELECT date_sub(curdate(), interval 5 day) as dateStr
            union all
            SELECT date_sub(curdate(), interval 6 day) as dateStr
        ) a left join (
          select date(create_time) as datetime, count(*) as count
          from cls_used_car.t_usedcar_merchant
          where firm_status = 0
          group by date(create_time)
        ) b on a.dateStr = b.datetime*/
;

#         SELECT a.dateStr as 'dateStr', ifnull(b.count,0) as 'dailyTruckApply'
#         FROM (
#             SELECT curdate() as dateStr
#             union all
#             SELECT date_sub(curdate(), interval 1 day) as dateStr
#             union all
#             SELECT date_sub(curdate(), interval 2 day) as dateStr
#             union all
#             SELECT date_sub(curdate(), interval 3 day) as dateStr
#             union all
#             SELECT date_sub(curdate(), interval 4 day) as dateStr
#             union all
#             SELECT date_sub(curdate(), interval 5 day) as dateStr
#             union all
#             SELECT date_sub(curdate(), interval 6 day) as dateStr
#         ) a LEFT JOIN (
#           SELECT date(create_time) as datetime, count(*) as count
#           FROM cls_used_car.t_usedcar_info
#           WHERE status = 0
#           GROUP BY date(create_time)
#         ) b ON a.dateStr = b.datetime




