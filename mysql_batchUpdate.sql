



-- 在mysql的一个数据库database中有100个表，每个表都有一个字段flag，现在要 将所有表中的flag字段设置为0，脚本命令应该如何写？
SELECT
  CONCAT( 'UPDATE ',  table_name, ' SET  create_time = str_to_date("2012-01-01 00:00", "%Y-%m-%d %H:%i");')    AS  `准备要执行的sql`
FROM
  information_schema.tables
WHERE
  table_schema = 'test';

UPDATE t_goods SET  create_time = str_to_date("2010-01-01 00:00", "%Y-%m-%d %H:%i");



-- 获取所有表的表名称 that 包含字段名称"Foo" :

SELECT table_schema, table_name
  FROM information_schema.columns
  WHERE column_name = 'create_time' AND  table_schema = 'test';




