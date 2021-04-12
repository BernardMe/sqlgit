



-- 在mysql的一个数据库database中有100个表，每个表都有一个字段flag，现在要 将所有表中的flag字段设置为0，脚本命令应该如何写？
UPDATE test.t_order SET  create_time = '2021-04-12 08:10:28' where order_id= 2;


-- create_time = '2021-04-12 08:10:28'转换
select create_time AS "date", date_format(create_time, '%Y-%m-%d %H:%i') AS "dateStr"
from t_order
where  order_id= 2
;



-- string  = '2021-04-12 08:10:28'转换
select '2021-04-12 08:10:28' AS "str", str_to_date('2021-04-12 08:10:28', '%Y-%m-%d %H:%i') AS "date"
from dual
;
