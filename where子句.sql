-- where �Ӿ�
--����ָ����ѯ������������/ɸѡ��ѯ����

--��ѯ10����Ա������Ϣ



--��ѯнˮ���ڵ���3000��Ա������Ϣ
SELECT * FROM emp WHERE sal>=3000;


-- in, ��ʾ��ĳ�������д���
SELECT * FROM emp WHERE ename IN ('KING','SMITH');

-- IS NULL : ��ʾ�ֶ�ֵΪnull
-- ��ѯ����û����ɵ�Ա������Ϣ
SELECT * FROM emp WHERE comm IS NULL;

-- ��ѯ��������ɵ�Ա������Ϣ
SELECT * FROM emp WHERE comm IS NOT NULL;-- ��nullȡ��
SELECT * FROM emp WHERE NOT comm IS NULL;-- ����������ȡ��

-- and �� or �����ȼ���
select * from emp where job='SALESMAN' or job='CLERK' and sal>=1280;
select * from emp where (job='SALESMAN' or job='CLERK') and sal>=1280;


