

--�������

/*һ��������Դ��һ��DML���
���������������
�û���ʾִ��commit �� rollback
�û�ִ�� DDL(insert update delete)
���ݿ��������ӶϿ���������Զ��ύ
�������Ͽ�����ʱ���Զ��ع�����
*/


DROP TABLE acct;
--���������ʻ���
CREATE TABLE acct (
       aid NUMBER(3) not null,
       aname  VARCHAR2(15),
       amoney NUMBER(7,2),
       
       --�����������Լ��
       CONSTRAINT pk_acct PRIMARY KEY (aid)
);



--��������
INSERT INTO acct values(001, '����', 10000);
INSERT INTO acct values(002, '����', 100);
INSERT INTO acct values(003, '����', 20000);

--��ѯ����
SELECT ROWNUM, t.* FROM acct t;

DELETE acct WHERE amoney=20000;



--ת������
UPDATE acct SET amoney=amoney-1000 WHERE aid=001;
UPDATE acct SET amoney=amoney+1000 WHERE aid=002;

--�ύ
COMMIT;

--�ع�
ROLLBACK;


--�û�ִ�� DDL��������Զ��ύ
DROP VIEW view_cla;

