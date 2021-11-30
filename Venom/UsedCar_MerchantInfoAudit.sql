



-- 根据id查询
--
SELECT t.*
FROM cls_used_car.t_usedcar_merchant t
WHERE t.id = 1
;


;


-- 总行数
SELECT COUNT(1) FROM cls_used_car.t_usedcar_merchant;
;




;








-- 查询商户类型，1个人，2商户
SELECT t.firm_type firmType
FROM cls_used_car.t_usedcar_merchant t
WHERE t.id = 1
;


