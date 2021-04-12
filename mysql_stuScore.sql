

--

-- 查询t_stu_score表中数学,语文都 >= 80分的学生姓名

select a.*, b.*
FROM
(
         select t1.name "name", t1.subject "sbj1", t1.score "sco1"
         from t_stu_score t1
           where t1.score >= 80 and t1.subject = '数学') a
INNER JOIN
(
         select  t2.name "name",  t2.subject "sbj2", t2.score "sco2"
         from   t_stu_score t2
         where t2.score >= 80 and  t2.subject = '语文') b
WHERE a.name = b.name
;






-- MySQL 查看session连接数和session状态

show processlist;

