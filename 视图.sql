

--��ͼ



--������ͼ��ҪdbaȨ��
--��ȨdbaȨ��to �û�bjsxt
GRANT DBA TO bjsxt;

CREATE OR REPLACE VIEW view_stu AS (
       SELECT * FROM student
);

--��ͼ�������ر��Ĳ�������
CREATE OR REPLACE VIEW view_stu AS (
       SELECT sno, sname, cno FROM student
);

SELECT * FROM view_stu;

--ͨ��view�޸����� �������� ɾ������
UPDATE view_stu SET sname='����' WHERE sno=112;
INSERT INTO view_stu VALUES(114, '����', 202);
DELETE view_stu WHERE sno=114;
--���� ORA-00913:ֵ����
INSERT INTO view_stu VALUES(114, '����', '��', 17, 202);

--�����ӵĲ�ѯ�򵥻�
--- ͳ�����а༶����ϸ��Ϣ�Լ��༶��������ƽ������
SELECT COUNT(s.sno), AVG(age), c.cno
FROM student s, clazz c
WHERE s.cno(+) = c.cno
GROUP BY c.cno
;



--����ֻ����ͼ: ֻ��ִ��DQL, ����ִ��DML
CREATE OR REPLACE VIEW view_cla AS (
     SELECT c.*,COUNT(s.sno) countStu, AVG(age) avrAge
     FROM student s, clazz c
     WHERE s.cno(+) = c.cno
     GROUP BY c.cno, c.cname, c.cdate
)WITH READ ONLY;

--�������ݱ��� ORA-01733: �˴�������������
INSERT INTO view_cla VALUES(4, 23, 202);

--ֱ�ӵ�����ͼ
SELECT * FROM view_cla;


-- ������ͼ��������ͼ
CREATE OR REPLACE VIEW view_test AS (SELECT cname, countStu FROM view_cla);
SELECT * FROM view_test;



