

--索引

--数据量大时，提高查询效率

--索引是关系数据库中用于存放每一条记录的一种对象，主要目的是加快数据的读取速度和完整性检查。建立索引是一项技术性要求高的工作。一般在数据库设计阶段的与数据库结构一道考虑。应用系统的性能直接与索引的合理直接有关。下面给出建立索引的方法和要点。

-- 3.5.1 建立索引
1. CREATE INDEX命令语法:

/*CREATE INDEX
CREATE [unique] INDEX [user.]index
ON [user.]table (column [ASC | DESC] [,column
[ASC | DESC] ] ... )
[CLUSTER [scheam.]cluster]
[INITRANS n]
[MAXTRANS n]
[PCTFREE n]
[STORAGE storage]
[TABLESPACE tablespace]
[NO SORT]
Advanced*/


--为sname列创建索引(默认ASC)，查询结果按照ASC，否则是插入顺序
CREATE INDEX idx_sname ON student(sname DESC);

SELECT sname FROM student;

--删除索引
DROP INDEX idx_sname;
